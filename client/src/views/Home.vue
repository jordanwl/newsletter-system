<template>
  <div>
    <profile></profile>
    <email-list></email-list>
  </div>
</template>

<script>
import EmailList from '../components/EmailList.vue'
import { onLogout } from '../vue-apollo.js'
import Profile from '../components/Profile.vue'

export default {
  name: 'home',
  components: {
    EmailList,
    Profile
  },
  methods: {
    logout: function () {
      onLogout(this.$apollo.provider.defaultClient)
    }
  }
}
</script>
