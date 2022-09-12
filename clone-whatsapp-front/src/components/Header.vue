<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap items-center justify-end">
        <!-- <a href="#" @click.prevent="signOut" class="link-grey px-2 no-underline" v-if="signedIn()">Sign out</a> -->
        <a v-on:click="signOut" href="#" >Sign out</a>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
  created () {
    this.signedIn()
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signedIn () {
      return localStorage.signedIn
    },
    signOut () {
      localStorage.clear()
      this.$router.push({name: 'Signin'})
    }
  }
}
</script>
