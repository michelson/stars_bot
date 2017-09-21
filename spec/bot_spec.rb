require "spec_helper"
require "pry"

describe "bot" do 
  it "will retrieve the list" do 
    expect(StarsBot::Queries.query(StarsBot::Queries::IndexQuery)).to be_any
    expect(1).to be == 1
  end

  it "checker will get filter in time" do 
    expect(StarsBot::Checker.fetch("2017-11-03", "08:00:00")).to be_present
  end
end