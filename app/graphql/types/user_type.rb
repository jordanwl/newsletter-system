module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :bio, String, null: true
  end
end
