module Types
  class SubscriptionType < BaseObject
    field :id, ID, null: false
    field :subscriber, SubscriberType, null: false
    field :newsletter, NewsletterType, null: false
  end
end
