module Types
  class EmailType < BaseObject
    field :id, ID, null: false
    field :newsletter, NewsletterType, null: false
    field :content, String, null: false
  end
end
