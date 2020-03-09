<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <router-link class="navbar-brand" to="/" tag="li">NewsHub</router-link>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" @click="showMenu = !showMenu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" :class="{ show : showMenu }" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <router-link class="nav-link text-white" to="/">Home</router-link>
        </li>
        <li class="nav-item active">
          <router-link class="nav-link text-white" to="/video">VideoChat</router-link>
        </li>
      </ul>
      <div>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item" v-if="!$store.state.isLoggedIn">
            <router-link  class="nav-item nav-link" to="/signin" >Sign-in</router-link>
          </li>
          <li v-else class="nav-item">
            <a  class="nav-item nav-link text-white" href="#" @click="logout">Logout</a>
          </li>
          <router-link class="navbar-right" to="/" tag="li">
            <img style="max-height:40px;" src="../assets/logo.png">
          </router-link>
        </ul>

      </div>
    </div>
  </nav>
</template>

<script>
import { onLogout } from '../vue-apollo'

export default {
  components: {
  },
  data () {
    return {
      showMenu: false
    }
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
