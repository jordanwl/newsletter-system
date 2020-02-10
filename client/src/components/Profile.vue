<template>
  <div class="card">
    <div class="card-header pb-0 bg-dark">
      <h4 class="card-title text-white"> {{ currentUser.username }}</h4>
    </div>
    <div class="card-body">
      <p class="card-text">{{ currentUser.bio }}</p>
    </div>
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
