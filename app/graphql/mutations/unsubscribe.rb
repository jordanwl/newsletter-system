module Mutations
  class Unsubscribe < BaseMutation
    argument :newsletter_name, String, required: true
    argument :unique_url, String, required: true

    type Types::SubscriptionType

    def resolve(newsletter_name: nil, unique_url: nil)
      subscriber = Subscriber.find_by(
        unique_url: unique_url
        )

      newsletter = Newsletter.find_by(
        name: newsletter_name
        )

      subscription = Subscription.find_by(
        subscriber: subscriber,
        newsletter: newsletter
        )

      return GraphQL::ExecutionError.new("invalid subscriber (subscriber url not valid)") if subscriber.nil?

      return GraphQL::ExecutionError.new("invalid newletter (not subscribed to / does not exist)") if subscription.nil?

      subscription.destroy!
      subscription
    end
  end
end
