<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link v-if="!$store.state.isLoggedIn" to="/signin" >Sign-in</router-link>
    <a v-else class="btn btn-primary" href="#" @click="logout">logout</a>
  </nav>
</template>

<script>
import { onLogout } from '../vue-apollo'

export default {
  name: 'app',
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
