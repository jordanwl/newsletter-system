<template>
  <div class="container bg-light border rounded py-3">
    <form @submit.prevent="newEmail()">
      <div class="form-group">
        <label for="newsletterId">Newsletter ID</label>
        <input v-model="newsletterId" class="form-control" aria-describedby="newsletterHelp" placeholder="Newsletter ID">
        <small id="newsletterHelp" class="form-text text-muted">Please enter a newsletter ID</small>
      </div>
      <div class="form-group">
        <label for="content">Content</label>
        <textarea v-model="content" class="form-control" aria-describedby="contentHelp" placeholder="Content" rows="5"/>
        <small id="contentHelp" class="form-text text-muted">Please enter your email content</small>
      </div>
      <button type="submit" class="btn btn-dark">Submit</button>
    </form>
  </div>
</template>

<script>
import { CREATE_EMAIL_MUTATION } from '../constants/graphql'

export default {
  data () {
    return {
      newsletterId: '',
      content: ''
    }
  },
  methods: {
    newEmail: function () {
      this.$apollo.mutate({
        mutation: CREATE_EMAIL_MUTATION,
        variables: {
          newsletterId: this.newsletterId,
          content: this.content
        }
      }).then(() => {
        this.$emit('newEmail')
      })
    }
  }
}
</script>
