<template>
  <div id="app">
    <nav>
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
      <router-link v-if="!isLoggedIn" to="/signin" >Sign-in</router-link>
      <a v-else class="btn btn-primary" href="#" @click="logout">logout</a>
    </nav>
    <router-view @loggedIn="logIn()"/>
  </div>
</template>

<script>

import { onLogout } from './vue-apollo'

export default {
  data: function () {
    return {
      isLoggedIn: !!localStorage.getItem('token') || false
    }
  },
  name: 'app',
  components: {
  },
  methods: {
    logIn: function () {
      this.isLoggedIn = true
    },
    logout: function () {
      onLogout(this.$apollo.provider.defaultClient).then(() => {
        this.isLoggedIn = false
        this.$router.push('/signin')
      })
    }
  }
}
</script>
