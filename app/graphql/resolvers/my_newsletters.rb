module Resolvers
  class MyNewsletters < BaseResolver
    description "Returns a user newsletters"

    type [Types::NewsletterType], null: false

    def resolve
      logged_in_check

      newsletters = context[:current_user].newsletters

      return GraphQL::ExecutionError.new("you have no newsletters") if newsletters.empty?

      newsletters
    end
  end
end
