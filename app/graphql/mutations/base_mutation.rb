module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    null false

    def logged_in_check
      raise GraphQL::ExecutionError.new("not logged in") if context[:current_user].nil?
    end
  end
end
