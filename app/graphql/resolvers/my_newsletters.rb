module Resolvers
  class MyNewsletters < BaseResolver
    description "Returns a user newsletters"

    type [Types::NewsletterType], null: false

    def resolve
      logged_in_check

      newsletters = Newsletter.where(user_id: context[:current_user].id)

      return GraphQL::ExecutionError.new("you have no newsletters") if newsletters.empty?

      newsletters
    end
  end
end
