<template>
  <header>
    <div class="container">
      <h2> Bienvenu sur Whatsapp !</h2>
        <b-button variant="outline-success" v-on:click="signOut" href="#">A bientôt!</b-button>
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
<style>
header {
  text-align: center;
  color: #98db7c;
  letter-spacing: 2px;
  margin: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #424242;
}
  </style>
