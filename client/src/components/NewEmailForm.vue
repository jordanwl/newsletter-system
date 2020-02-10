<template>
  <div>
    <form @submit.prevent="newEmail()">
      <input v-model="newsletterId" placeholder="newsletterId">
      <input v-model="content">
      <input type="submit" value="Submit">
    </form>
    <p>{{ newsletterId }}</p>
    <p>{{ content }}</p>
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
      })
    }
  }
}
</script>
