module Types
  class SubscriberType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :unique_url, String, null: false
    field :subscribed_to, [NewsletterType], null: true

    def subscribed_to
      object.newsletters
    end
  end
end
