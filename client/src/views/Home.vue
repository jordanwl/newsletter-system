<template>
  <div class="container">
    <div class="row">
      <email-list class="col-md-8 col-sm-12" ></email-list>
      <div class="col-4">
        <profile class="d-none d-md-block"></profile>
        <new-email-form @newEmail="reloadEmails" class="mt-3"></new-email-form>
      </div>
    </div>
  </div>
</template>

<script>
import NewEmailForm from '../components/NewEmailForm.vue'
import EmailList from '../components/EmailList.vue'
import Profile from '../components/Profile.vue'

export default {
  name: 'home',
  components: {
    NewEmailForm,
    EmailList,
    Profile
  },
  methods: {
    reloadEmails: function () {
      // TO DO: FIGURE OUT HOW TO MAKE EMAIL LIST COMPONENT REFRESH WHEN A NEW EMAIL IS CREATED
      this.$apollo.queries.MY_EMAILS_QUERY.refetch()
    }
  }
}
</script>
