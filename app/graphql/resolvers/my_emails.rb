module Resolvers
  class MyEmails < BaseResolver
    description "Returns a user newsletters"

    argument :pagination, Types::Pagination, required: false

    type [Types::EmailType], null: false

    def resolve(pagination: {offset: 0, limit: 5})
      logged_in_check

      emails = context[:current_user].emails

      return GraphQL::ExecutionError.new("you have no newsletters") if emails.empty?

      emails[pagination[:offset],pagination[:limit]]
    end
  end
end
