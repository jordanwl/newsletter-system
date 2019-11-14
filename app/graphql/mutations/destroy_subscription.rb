module Mutations
  class DestroySubscription < BaseMutation
    argument :subscriber_email, String, required: true
    argument :newsletter_id, ID, required: true

    type Types::SubscriptionType

    def resolve(subscriber_email: nil, newsletter_id: nil)

      subscriber = Subscriber.find_by(email: subscriber_email)

      newsletter_ownership_check = !context[:current_user].newsletters.pluck(:id).include?(newsletter_id.to_i)

      subscription = Subscription.find_by(
        subscriber: subscriber,
        newsletter_id: newsletter_id
        )

      return GraphQL::ExecutionError.new("invalid subscription (check if subscriber ID/newsletter ID exists and if subscribed)") if subscription.nil? || newsletter_ownership_check

      subscription.destroy!

      subscription
    end
  end
end
