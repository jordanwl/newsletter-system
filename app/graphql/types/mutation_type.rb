module Types
  class MutationType < Types::BaseObject
    # create
    field :create_user, mutation: Mutations::CreateUser
    field :create_newsletter, mutation: Mutations::CreateNewsletter
    field :create_email, mutation: Mutations::CreateEmail
    field :create_subscriber, mutation: Mutations::CreateSubscriber
    field :subscribe, mutation: Mutations::Subscribe

    # destroy
    field :destroy_user, mutation: Mutations::DestroyUser
    field :destroy_newsletter, mutation: Mutations::DestroyNewsletter
    field :destroy_email, mutation: Mutations:: DestroyEmail
    field :destroy_subscription, mutation: Mutations::DestroySubscription
    field :unsubscribe, mutation: Mutations::Unsubscribe

    # update
    field :edit_user, mutation: Mutations::EditUser
    field :edit_email, mutation: Mutations::EditEmail
    field :edit_subscriber, mutation: Mutations::EditSubscriber
    field :edit_newsletter, mutation: Mutations::EditNewsletter

    field :signin_user, mutation: Mutations::SignInUser
    field :send_email, mutation: Mutations::SendEmail
  end
end
