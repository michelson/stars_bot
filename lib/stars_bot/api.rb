require "graphql/client"
require "graphql/client/http"


module StarsBot
  class API
    # Configure GraphQL endpoint using the basic HTTP network adapter.
    HTTP = GraphQL::Client::HTTP.new("https://api-starsconf.synaptic.cl/graphql")

    # Fetch latest schema on init, this will make a network request
    Schema = GraphQL::Client.load_schema(HTTP)

    # However, it's smart to dump this to a JSON file and load from disk
    #
    # Run it from a script or rake task
    #   GraphQL::Client.dump_schema(SWAPI::HTTP, "path/to/schema.json")
    #
    # Schema = GraphQL::Client.load_schema("path/to/schema.json")
    Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

    def self.dump_schema
      GraphQL::Client.dump_schema(StarsBot::Fetcher::HTTP, "./schema.json")
    end

    def self.load_schema
      GraphQL::Client.load_schema("./schema.json")
    end
  end
end
