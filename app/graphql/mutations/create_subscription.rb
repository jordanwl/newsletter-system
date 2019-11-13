module Mutations
  class CreateSubscription < BaseMutation
    argument :subscriber_id, ID, required: true
    argument :newsletter_id, ID, required: true

    type Types::SubscriptionType

    def resolve(subscriber_id: nil, newsletter_id: nil)

      subscription = Subscription.new(
        subscriber_id: subscriber_id,
        newsletter_id: newsletter_id
        )

      return GraphQL::ExecutionError.new("invalid subscription (check if subscriber ID/newsletter ID exist and if combination is unique)") if !subscription.valid?

      subscription.save!

      subscription
    end
  end
end
