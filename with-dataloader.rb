require 'graphql'
require 'json'

class ItemLoader < GraphQL::Dataloader::Source
  def fetch(keys)
    puts "Fetching keys #{keys}"
    keys.map { |key| "The letter #{key}" }
  end
end

class QueryType < GraphQL::Schema::Object
  field :item, String do
    argument :key, String
  end

  def item(key:)
    puts "calling the resolver for key #{key}"
    dataloader.with(ItemLoader).load(key)
  end
end

class Schema < GraphQL::Schema
  query QueryType
  use GraphQL::Dataloader
end

query = <<-GRAPHQL
  query {
    query0: item(key: "a")
    query1: item(key: "a")
    query2: item(key: "b")
    query3: item(key: "c")
    query4: item(key: "d")
    query5: item(key: "d")
  }
GRAPHQL

result = Schema.execute(query)
puts JSON.pretty_generate(result.to_h)
