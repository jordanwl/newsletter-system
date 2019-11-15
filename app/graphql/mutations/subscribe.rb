module Mutations
  class Subscribe < BaseMutation
    argument :subscriber_email, String, required: true
    argument :newsletter_id, ID, required: true

    type Types::SubscriptionType

    def resolve(subscriber_email: nil, newsletter_id: nil)

      subscriber = Subscriber.find_by(email: subscriber_email)

      subscription = Subscription.new(
        subscriber: subscriber,
        newsletter_id: newsletter_id
        )

      return GraphQL::ExecutionError.new("invalid subscription (check if subscriber ID/newsletter ID exist and if combination is unique)") if !subscription.valid?

      subscription.save!

      # create new subtracker object to track subs

      # SubTracker.create!(
      #   subscriber_id: subscriber.id,
      #   newsletter_id: newsletter_id,
      #   action: "subscribe")

      subscription
    end
  end
end
