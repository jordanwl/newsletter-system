module Mutations
  class CreateSubscriber < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true

    type Types::SubscriberType

    def resolve(name: name, email: email)
      Subscriber.create!(
        name: name,
        email: email
        )
    end
  end
end
