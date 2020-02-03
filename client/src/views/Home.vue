<template>
  <div>
    <email-list></email-list>
  </div>
</template>

<script>
import EmailList from '../components/EmailList.vue'
import { onLogout } from '../vue-apollo.js'

export default {
  name: 'home',
  components: {
    EmailList
  },
  methods: {
    logout: function () {
      onLogout(this.$apollo.provider.defaultClient)
    }
  }
}
</script>
