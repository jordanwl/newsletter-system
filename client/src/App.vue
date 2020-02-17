<template>
  <div id="app">
    <nav-bar></nav-bar>
    <div class="container my-3">
      <router-view/>
    </div>
    <div class="footer">
      <div class="footer-links">
        <a href="#"><i class="fab fa-github"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-linkedin"></i></a>
      </div>
      <div class="footer-copyright">
        This footer is made with <i class="fas fa-heart"></i> at Le Wagon
      </div>
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

<style lang="scss" scoped>
.card-spacer:not(:first-child) {
  margin-top: .5rem;
}
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background: #F4F4F4;
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 100px;
  padding: 0px 50px;
  color: rgba(0,0,0,0.3);
}
.footer-links {
  display: flex;
  align-items: center;
}
.footer-links a {
  color: black;
  opacity: 0.15;
  text-decoration: none;
  font-size: 24px;
  padding: 0px 10px;
}
.footer-links a:hover {
  opacity: 1;
}
.footer .fa-heart {
  color: #D23333;
}
</style>
