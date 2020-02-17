<template>
  <div class="container bg-light border rounded py-3 w-50 d-flex flex-column align-items-center">
    <h5 class="text-center">Welcome to NewsHub!</h5>
    <form class="w-75" @submit.prevent="signIn()">
      <div class="form-group">
        <label>Email address</label>
        <input v-model="email" type="email" class="form-control" aria-describedby="emailHelp" placeholder="Enter email">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
      <div class="form-group">
        <label>Password</label>
        <input v-model="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </form>
  </div>
</template>

<script>
import { SIGN_IN_MUTATION } from '../constants/graphql'
import { onLogin } from '../vue-apollo.js'

export default {
  name: 'SignIn',
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
        this.$store.commit('setLoggedIn', true)
        this.$router.push('/')
      })
    }
  }
}
</script>
