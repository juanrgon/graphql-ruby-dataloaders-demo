# Script that reproduces the issue in https://github.com/rmosolgo/graphql-ruby/issues/5020

require 'graphql'
require 'json'

class ItemLoader < GraphQL::Dataloader::Source
  def fetch(keys)
    puts "fetching keys #{keys}"
    keys.map { |key| GraphQL::ExecutionError.new("Error for #{key}") }
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
  }
GRAPHQL

result = Schema.execute(query)
puts JSON.pretty_generate(result.to_h)
