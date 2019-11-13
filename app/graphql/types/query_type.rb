module Types
  class QueryType < Types::BaseObject
    field :my_newsletters, resolver: Resolvers::MyNewsletters
    field :my_subscribers, resolver: Resolvers::MySubscribers
    field :my_emails, resolver: Resolvers::MyEmails
  end
end
