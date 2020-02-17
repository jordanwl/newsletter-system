<template>
  <div class="card pb-3">
    <div class="card-header p-1 bg-dark border d-flex justify-content-between">
      <h5 class="card-title text-white pt-2 pl-2">Newsletters</h5>
    </div>
    <button class="text-left p-2 my-2 btn btn-block" @click="clearFilter()">Reset Filter</button>
    <button type="button" v-for="newsletter in myNewsletters"
      :key="newsletter.id"
      class="text-left p-2 my-2 btn btn-block"
      :class="[ selected === newsletter.id ? 'btn-secondary' : 'btn-light' ]"
      @click="selectFilter(newsletter.id)">
      {{newsletter.id}}. {{ newsletter.name }}
    </button>
  </div>
</template>

<script>
import { MY_NEWSLETTERS_QUERY } from '../constants/graphql'

export default {
  apollo: {
    myNewsletters: {
      query: MY_NEWSLETTERS_QUERY
    }
  },
  data () {
    return {
      selected: ''
    }
  },
  methods: {
    selectFilter (newsletterId) {
      this.selected = newsletterId
      this.$root.$emit('filter', newsletterId)
    },
    clearFilter () {
      this.selected = ''
      this.$root.$emit('filter', null)
    }
  }
}
</script>
