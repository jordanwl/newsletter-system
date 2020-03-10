<template>
  <div>
    <div v-for="email in myEmails" :key="email.id" class="card card-spacer">
      <h5 class="card-header border">{{ email.newsletter.name }}</h5>
      <div class="card-body">
        <blockquote class="blockquote mb-0">
          <p> {{ email.content }} </p>
          <div class="d-flex justify-content-between">
            <footer class="blockquote-footer">
              {{ email.newsletter.user.email }}
            </footer>
            <a @click="destroyEmail(email.id)">
              <i class="fa fa-trash" aria-hidden="true" />
            </a>
          </div>
        </blockquote>
      </div>
    </div>
  </div>
</template>

<script>
import { MY_EMAILS_QUERY, DESTROY_EMAIL_MUTATION } from '../constants/graphql'

export default {
  data () {
    return {
      myEmails: [],
      newsletterId: ''
    }
  },
  apollo: {
    myEmails: {
      query: MY_EMAILS_QUERY
    }
  },
  methods: {
    refetch () {
      this.$apollo.queries.myEmails.refetch()
    },
    destroyEmail (emailId) {
      console.log('test')
      this.$apollo.mutate({
        mutation: DESTROY_EMAIL_MUTATION,
        variables: {
          emailId: emailId
        }
      })
      this.refetch()
    },
    filter (value) {
      this.newsletterId = value
      this.refetch()
    }
  },
  mounted () {
    this.$root.$on('filter', this.filter)
    this.$root.$on('new-email', this.refetch)
  },
  destroyed () {
    this.$root.$off('filter', this.filter)
    this.$root.$off('new-email', this.refetch)
  }
}
</script>

<style lang="scss" scoped>
.card-spacer:not(:first-child) {
  margin-top: .5rem;
}
</style>
