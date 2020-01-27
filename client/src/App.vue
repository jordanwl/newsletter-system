<template>
  <div>
    <SignInForm></SignInForm>
    <div id="app">
      <EmailList></EmailList>
    </div>
  </div>
</template>

<script>
import EmailList from '@/components/EmailList.vue'
import SignInForm from '@/components/SignIn.vue'

export default {
  name: 'app',
  components: {
    EmailList,
    SignInForm
  }
}
</script>
