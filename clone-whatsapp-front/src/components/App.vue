<template>
  <div id="app">
    <Header/>
    <router-view></router-view>
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
    Messages,

  }
}
</script>
