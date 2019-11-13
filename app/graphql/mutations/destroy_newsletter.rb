module Mutations
  class DestroyNewsletter < BaseMutation
    argument :newsletter_id, ID, required: true

    type String

    def resolve(newsletter_id: nil)
      logged_in_check

      newsletter = Newsletter.find_by(id: newsletter_id, user_id: context[:current_user].id)

      return GraphQL::ExecutionError.new("invalid newsletter_id (not yours/not created)") if newsletter.nil?

      newsletter.destroy!

      "Newsletter (ID: #{newsletter.id}, name: #{newsletter.name}) successfully deleted"
    end
  end
end
