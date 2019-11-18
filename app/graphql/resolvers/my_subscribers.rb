module Resolvers
  class MySubscribers < BaseResolver
    description "Returns all subcribers from all of current user's newsletters"

    argument :pagination, Types::Pagination, required: false

    type [Types::SubscriberType], null: false

    def resolve(pagination: {offset: 0, limit: 5})
      logged_in_check

      subscribers = []

      newsletter_ids = context[:current_user].newsletters.pluck(:id)

      subscriber_ids = Subscription.where(newsletter_id: newsletter_ids).distinct.offset(pagination[:offset]).limit(pagination[:limit])

      subscribers = Subscriber.where(id: subscriber_ids)

      return GraphQL::ExecutionError.new("you have no subscribers") if subscribers.empty?

      subscribers
    end
  end
end
