module Mutations
  class EditEmail < BaseMutation
    argument :email_id, ID, required: true
    argument :content, String, required: true

    type Types::EmailType

    def resolve(email_id: nil, content: nil)
      logged_in_check

      email = Email.find_by(id: email_id)

      email.update!(content: content)
      email

      rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
