module Mutations
  class CreateNewsletter < BaseMutation
    argument :name, String, required: true

    type Types::NewsletterType

    def resolve(name: nil)
      logged_in_check

      Newsletter.create!(
        user_id: context[:current_user].id,
        name: name
        )
    end
  end
end
