module Types
  class SubscriptionType < BaseObject
    field :id, ID, null: false
    field :subscriber_id, ID, null: false
    field :newsletter_id, ID, null: false
  end
end
