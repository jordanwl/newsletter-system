module Resolvers
  class MySubscribers < BaseResolver
    description "Returns all subcribers from all of current user's newsletters"

    type [Types::SubscriberType], null: false

    def resolve
      logged_in_check

      subscribers = []

      context[:current_user].newsletters.each do |newsletter|
        subscribers << newsletter.subscribers
      end

      return GraphQL::ExecutionError.new("you have no subscribers") if subscribers.empty?

      subscribers.flatten.uniq
    end
  end
end
