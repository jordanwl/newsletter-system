module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver

    def logged_in_check
      raise GraphQL::ExecutionError.new("not logged in") if context[:current_user].nil?
    end
  end
end
