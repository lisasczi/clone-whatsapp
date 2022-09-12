<template>
  <div id="app">
    <img height="100px" width="100px" src="./assets/whatsapp.png">
    <Header/>
    <router-view/>
  </div>
</template>

<script>
import Header from './components/Header.vue'
import Signin from './components/Signin.vue'
import Signup from './components/Signup.vue'
import Messages from './components/Messages.vue'

export default {
  name: 'App',
  components: {
    Header,
    Signin,
    Signup,
    Messages
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
