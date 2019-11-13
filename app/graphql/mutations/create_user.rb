module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(email: nil, username: nil, password: nil)
      User.create!(
        username: username,
        password: password,
        email: email
      )
    end
  end
end
