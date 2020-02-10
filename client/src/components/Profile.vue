<template>
  <div class="card">
    <div class="card-header p-1 bg-dark border d-flex justify-content-between">
      <h4 class="card-title text-white pt-2 pl-2"> {{ currentUser.username }}</h4>
      <img src="../assets/yoshi.png" class="rounded-circle" style="width:45px" alt="">
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
