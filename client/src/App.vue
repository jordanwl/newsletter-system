<template>
  <div id="app" >
    <nav-bar></nav-bar>
    <div class="container py-3 mb-5">
      <router-view/>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Footer from '../src/components/Footer.vue'
import NavBar from '../src/components/Navbar.vue'

export default {
  components: {
    Footer,
    NavBar
  }
}
</script>
<style lang="scss">
html {
  overflow-y: scroll
}
</style>
