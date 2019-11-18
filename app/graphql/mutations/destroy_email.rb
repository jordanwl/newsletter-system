module Mutations
  class DestroyEmail < BaseMutation
    argument :email_id, ID, required: true
    argument :newsletter_id, ID, required: true

    type Types::EmailType

    def resolve(email_id: nil)
      logged_in_check

      email = Email.find_by(id: email_id)

      return GraphQL::ExecutionError.new("invalid email_id (not yours/not created)") if email.nil? || !context[:current_user].emails.include?(email)

      email.destroy!
    end
  end
end
