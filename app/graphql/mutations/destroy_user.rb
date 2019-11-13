module Mutations
  class DestroyUser < BaseMutation
    type Types::UserType

    def resolve(newsletter_id: nil)
      logged_in_check

      context[:current_user].destroy!
    end
  end
end
