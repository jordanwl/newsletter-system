<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
    <div class="navbar-nav">
      <router-link class="nav-item nav-link" to="/">Home</router-link>
      <router-link class="nav-item nav-link" to="/new">New Email</router-link>
    </div>
    <div class="navbar-nav">
      <router-link v-if="!$store.state.isLoggedIn" class="nav-item nav-link" to="/signin" >Sign-in</router-link>
      <a v-else class="nav-item nav-link" href="#" @click="logout">Logout</a>
      <router-link class="navbar-right" to="/">
        <img style="max-height:40px;" src="../assets/logo.png">
      </router-link>
    </div>
  </nav>
</template>

<script>
import { onLogout } from '../vue-apollo'

export default {
  components: {
  },
  methods: {
    logout: function () {
      onLogout(this.$apollo.provider.defaultClient).then(() => {
        this.$store.commit('setLoggedIn', false)
        this.$router.push('/signin')
      })
    }
  }
}
</script>
