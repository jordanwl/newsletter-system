<template>
  <div class="container">
    <div class="row">
      <email-list class="col-md-8 col-sm-12"></email-list>
      <div class="col-4">
        <profile class="d-none d-md-block"></profile>
        <create-email class="mt-3"></create-email>
      </div>
    </div>
  </div>
</template>

<script>
import CreateEmail from '../components/NewEmailForm.vue'
import EmailList from '../components/EmailList.vue'
import { onLogout } from '../vue-apollo.js'
import Profile from '../components/Profile.vue'

export default {
  name: 'home',
  components: {
    CreateEmail,
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
