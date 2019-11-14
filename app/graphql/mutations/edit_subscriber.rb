module Mutations
  class EditSubscriber < BaseMutation
    argument :subscriber_args, Types::SubscriberArgs, required: true
    argument :unique_url, String, required: true

    type Types::SubscriberType

    def resolve(subscriber_args: nil, unique_url: nil)
      subscriber = Subscriber.find_by(
        unique_url: unique_url
        )

      return GraphQL::ExecutionError.new("invalid subscriber (subscriber url not valid)") if subscriber.nil?

      subscriber.update!(subscriber_args.to_h)
      subscriber
    end
  end
end
