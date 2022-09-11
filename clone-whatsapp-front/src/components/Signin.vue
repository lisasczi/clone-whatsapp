<template>
  <div class="container">
    <div class="w-100 p-3 bg-secondary text-light">
      <div class="border p-10 border-grey-light shadow rounded">
        <h3 class="text-2xl mb-6 text-grey-darkest">Sign In</h3>
        <form @submit.prevent="signin">
          <div class="text-red" v-if="error">{{ error }}</div>

          <div class="mb-6">
            <label for="phone_number" class="label">Numéro de téléphone</label>
            <input type="phone_number" v-model="phone_number" class="input" id="phone_number" placeholder="06..">
          </div>
          <br>
          <div class="mb-6">
            <label for="name" class="label">Prénom</label>
            <input type="name" v-model="name" class="input" id="name" placeholder="Prénom">
          </div>
          <br>
          <div class="mb-6">
            <label for="last_name" class="label">Nom de famille</label>
            <input type="last_name" v-model="last_name" class="input" id="last_name" placeholder="Nom de famille">
          </div>
          <br>
          <b-button variant="outline-dark" type="submit" >Sign In</b-button>
            <br>
            <br>
          <div><router-link to="/signup" class="link-grey">Sign up</router-link></div>
            <br>
        </form>
      </div>
    </div>
  </div>
</template>

<script>

import services from '../services/user.js'
export default {
  name: 'Signin',
  data () {
    return {
      phone_number: '',
      name: '',
      last_name: '',
      error: ''
    }
  },
  // created () {
  //   this.checkSignedIn()
  // },
  // updated () {
  //   this.checkSignedIn()
  // },
  methods: {
    signin () {
      services
        .signin(this.phone_number)
        .then((response) => this.signinSuccessful(response))
        .catch((error) => this.signinFailed(error))
    },
    signinSuccessful (response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.user = JSON.stringify(response.data.user)
      localStorage.token = response.data.token
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/messages')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/messages')
      }
    }
  }
}
</script>
