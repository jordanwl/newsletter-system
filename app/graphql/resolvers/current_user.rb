module Resolvers
  class CurrentUser < BaseResolver
    description "Returns current user"

    type Types::UserType, null: false

    def resolve
      logged_in_check

      context[:current_user]
    end
  end
end
