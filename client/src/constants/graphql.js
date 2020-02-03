import gql from 'graphql-tag'

export const CURRENT_USER_QUERY = gql`
  query currentUser{
    currentUser {
      id
      email
      username
    }
  }
`

export const MY_EMAILS_QUERY = gql`
  query myEmails {
    myEmails {
    id
    content
      newsletter {
        id
        name
        user {
          email
          id
          username
        }
      }
    }
  }
`

export const SIGN_IN_MUTATION = gql`
  mutation signinUser($email: String!, $password: String!) {
    signinUser(email: $email, password: $password) {
      token
    }
  }
`
