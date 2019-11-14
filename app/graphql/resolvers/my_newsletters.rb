module Resolvers
  class MyNewsletters < BaseResolver
    description "Returns a user newsletters"

   argument :pagination, Types::Pagination, required: false

    type [Types::NewsletterType], null: false

    def resolve(pagination: {offset: 0, limit: 5})
      logged_in_check

      newsletters = context[:current_user].newsletters

      return GraphQL::ExecutionError.new("you have no newsletters") if newsletters.empty?

      newsletters[pagination[:offset],pagination[:limit]]
    end
  end
end
