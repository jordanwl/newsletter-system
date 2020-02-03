<template>
  <div id="app">
    <nav-bar></nav-bar>
    <div class="container my-3">
      <router-view/>
    </div>
  </div>
</template>

<script>
import NavBar from '../src/components/Navbar.vue'

export default {
  components: {
    NavBar
  }
}
</script>
