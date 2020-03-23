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
            <div>
              <a class="mr-2" style="cursor: pointer" @click="showEdit(email.id)">
                <i class="fa fa-pen" aria-hidden="true" />
              </a>
              <a style="cursor: pointer" @click="destroyEmail(email.id)">
                <i class="fa fa-trash" aria-hidden="true" />
              </a>
            </div>
          </div>
        </blockquote>
        <div v-if="editEmailId == email.id">
          <div class="form-group" >
            <label for="newContent">New content:</label>
            <textarea class="form-control" id="newContent" v-model="newContent" rows="3"></textarea>
          </div>
          <button @click="editEmail" class="btn btn-primary float-right">Submit</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { MY_EMAILS_QUERY, DESTROY_EMAIL_MUTATION, EDIT_EMAIL_MUTATION } from '../constants/graphql'

export default {
  data () {
    return {
      myEmails: [],
      newsletterId: '',
      editEmailId: '',
      newContent: ''
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
      this.$apollo.mutate({
        mutation: DESTROY_EMAIL_MUTATION,
        variables: {
          emailId: emailId
        }
      })
      this.refetch()
    },
    editEmail () {
      this.$apollo.mutate({
        mutation: EDIT_EMAIL_MUTATION,
        variables: {
          emailId: this.editEmailId,
          content: this.newContent
        }
      }).then(() => {
        this.refetch()
        this.editEmailId = ''
        this.newContent = ''
      })
    },
    showEdit (id) {
      this.editEmailId = id
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
