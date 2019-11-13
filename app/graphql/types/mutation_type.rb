module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_newsletter, mutation: Mutations::CreateNewsletter

    field :destroy_newsletter, mutation: Mutations::DestroyNewsletter

    field :signin_user, mutation: Mutations::SignInUser
  end
end
