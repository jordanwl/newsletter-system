module Types
  class QueryType < Types::BaseObject
    field :my_newsletters, resolver: Resolvers::MyNewsletters
  end
end
