module Resolvers
  class MyEmails < BaseResolver
    description "Returns a user newsletters"

    argument :newsletter_id, ID, required: false

    type [Types::EmailType], null: false

    def resolve(newsletter_id: nil)
      logged_in_check

      emails = context[:current_user].emails.order(created_at: :desc).limit(5)

      return GraphQL::ExecutionError.new("you have no newsletters") if emails.empty?

      newsletter_id ? emails.where(newsletter_id: newsletter_id) : emails
    end
  end
end
