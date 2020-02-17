<template>
  <div class="container">
    <div class="row">
      <email-list class="col-lg-12 col-xl-8"></email-list>
      <div class="col-4">
        <profile class="d-none d-xl-block"></profile>
        <new-email-form class="d-none d-xl-block mt-3"></new-email-form>
        <newsletter-list class="d-none d-xl-block mt-3"></newsletter-list>
      </div>
    </div>
  </div>
</template>

<script>
import NewEmailForm from '../components/NewEmailForm.vue'
import EmailList from '../components/EmailList.vue'
import Profile from '../components/Profile.vue'
import NewsletterList from '../components/NewsletterList.vue'

export default {
  name: 'home',
  components: {
    NewEmailForm,
    EmailList,
    Profile,
    NewsletterList
  }
}
</script>
