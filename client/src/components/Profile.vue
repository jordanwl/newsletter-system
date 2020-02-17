<template>
  <div class="card">
    <div class="card-header p-1 bg-dark border d-flex justify-content-between">
      <h5 class="card-title text-white pt-2 pl-2"> {{ currentUser.username }}</h5>
      <img src="../assets/frog.jpg" class="rounded-circle" style="width:50px">
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
