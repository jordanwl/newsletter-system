module Mutations
  class CreateUser < BaseMutation
    argument :user_args, Types::UserArgs, required: true

    type Types::UserType

    def resolve(user_args: nil)
      context[:current_user].update!(
        user_args.to_h
      )

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
