<template>
  <div class="d-flex">
    <div class="row">
      <email-list class="col-md-8 col-sm-12"></email-list>
      <profile class="col-4 d-none d-md-block"></profile>
    </div>
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
