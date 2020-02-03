<template>
  <div>
    <div v-for="email in myEmails" :key="email.id" class="card m-2">
      <h5 class="card-header">
        {{ email.newsletter.name }}
      </h5>
      <div class="card-body">
        <blockquote class="blockquote mb-0">
          <p> {{ email.content }} </p>
          <footer class="blockquote-footer"> {{ email.newsletter.user.email }} </footer>
        </blockquote>
      </div>
    </div>
  </div>
</template>

<script>
import { MY_EMAILS_QUERY } from '../constants/graphql'

export default {
  data () {
    return {
      myEmails: []
    }
  },
  apollo: {
    myEmails: {
      query: MY_EMAILS_QUERY
    }
  }
}
</script>
