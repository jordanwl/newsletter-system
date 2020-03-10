import gql from 'graphql-tag'

export const CURRENT_USER_QUERY = gql`
  query currentUser{
    currentUser {
      id
      email
      username
      bio
    }
  }
`

export const MY_EMAILS_QUERY = gql`
  query myEmails($newsletterId: ID) {
    myEmails(newsletterId: $newsletterId) {
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

export const MY_NEWSLETTERS_QUERY = gql`
  query myNewsletters {
    myNewsletters {
      id
      name
      user {
        bio
        email
        id
        username
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

export const CREATE_EMAIL_MUTATION = gql`
  mutation createEmail($newsletterId: ID!, $content: String!) {
    createEmail(newsletterId: $newsletterId, content: $content)
    {
      id
      content
      newsletter {
        id
        name
        user {
          id
          username
          email
          bio
        }
      }
    }
  }
`

export const DESTROY_EMAIL_MUTATION = gql`
  mutation destroyEmail($emailId: ID!) {
    destroyEmail(emailId: $emailId) {
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
