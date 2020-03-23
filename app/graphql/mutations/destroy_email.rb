module Mutations
  class DestroyEmail < BaseMutation
    argument :email_id, ID, required: true

    type Types::EmailType

    def resolve(email_id: nil)
      logged_in_check

      email = Email.find_by(id: email_id)

      email.destroy!
    end
  end
end
