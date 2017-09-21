module StarsBot 
  class Queries

    IndexQuery = API::Client.parse <<-'GRAPHQL'
      query {
        
        allTimeSlots {
          id
          talkSet {
            id
            name
            category
            room
            speaker {
              id
              name
            }
          }
          date
          start
        }

      }
    GRAPHQL

    def self.query(definition, variables = {})
      response = API::Client.query(
        definition,
        variables: variables,
        context: {}
      )

      if response.errors.blank?
        response
      else
        raise response.errors
      end
    end

  end
end