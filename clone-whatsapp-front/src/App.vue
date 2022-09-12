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
  font-family: sans-serif;
  color: #424242;
  letter-spacing: 2px;
  margin: 20px;
  text-align: center;
  background-color: #e2d9d2;
}
</style>
