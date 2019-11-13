module Types
  class NewsletterType < BaseObject
    field :id, ID, null: false
    field :user, UserType, null: false
    field :name, String, null: false
  end
end
