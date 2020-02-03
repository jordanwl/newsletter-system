<template>
  <div>
    <form @submit.prevent="signIn()">
      <input v-model="email" placeholder="jordan1@test.com">
      <input v-model="password" placeholder="password">
      <input type="submit" value="Submit">
    </form>
    <p>{{ email }}</p>
    <p>{{ password }}</p>
  </div>
</template>

<script>
import { SIGN_IN_MUTATION } from '../constants/graphql'
import { onLogin } from '../vue-apollo.js'

export default {
  name: 'SignIn',
  data () {
    return {
      email: 'jordan1@test.com',
      password: 'password'
    }
  },
  methods: {
    signIn: function () {
      this.$apollo.mutate({
        mutation: SIGN_IN_MUTATION,
        variables: {
          email: this.email,
          password: this.password
        }
      }).then(data => {
        onLogin(this.$apollo.provider.defaultClient, data['data']['signinUser']['token'])
        this.$emit('loggedIn')
        this.$router.push('/')
      })
    }
  }
}
</script>
