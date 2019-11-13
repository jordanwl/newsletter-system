module Mutations
  class CreateEmail < BaseMutation
    argument :newsletter_id, ID, required: true
    argument :content, String, required: true

    type Types::EmailType

    def resolve(content: content, newsletter_id: newsletter_id)
      logged_in_check

      newsletter = Newsletter.find_by(id: newsletter_id, user_id: context[:current_user].id)

      return GraphQL::ExecutionError.new("invalid newsletter_id (not yours/not created)") if newsletter.nil?

      Email.create!(
        newsletter_id: newsletter_id,
        content: content
        )
    end
  end
end
