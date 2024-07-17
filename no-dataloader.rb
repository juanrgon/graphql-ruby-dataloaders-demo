require 'graphql'
require 'json'

class QueryType < GraphQL::Schema::Object
  field :item, String do
    argument :key, String
  end

  def item(key:)
    puts "calling the resolver for key #{key}"
    "The letter #{key}"
  end
end

class Schema < GraphQL::Schema
  query QueryType
end

query = <<-GRAPHQL
  query {
    query0: item(key: "a")
    query1: item(key: "b")
  }
GRAPHQL

result = Schema.execute(query)
puts JSON.pretty_generate(result.to_h)
