module Mutations
  class CreateSubscriber < BaseMutation
    argument :subscriber_args, Types::SubscriberArgs, required: true

    type Types::SubscriberType

    def resolve(subscriber_args: nil)
      Subscriber.create!(
        subscriber_args.to_h
        )

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
