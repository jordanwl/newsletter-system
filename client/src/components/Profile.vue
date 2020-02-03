<template>
  <div class="container">
    <h4 v-if="loading">Loading...</h4>
    <div>{{ currentUser.id }}</div>
    <div>{{ currentUser.username }}</div>
  </div>
</template>

<script>
import { CURRENT_USER_QUERY } from '../constants/graphql'

export default {
  data () {
    return {
      currentUser: '',
      loading: 0
    }
  },
  apollo: {
    currentUser: {
      query: CURRENT_USER_QUERY
    }
  }
}
</script>
