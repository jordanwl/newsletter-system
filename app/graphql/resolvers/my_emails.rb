module Resolvers
  class MyEmails < BaseResolver
    description "Returns a user newsletters"

    type [Types::EmailType], null: false

    def resolve
      logged_in_check

      emails = context[:current_user].emails.order(created_at: :desc).limit(5)

      return GraphQL::ExecutionError.new("you have no newsletters") if emails.empty?

      emails
    end
  end
end
