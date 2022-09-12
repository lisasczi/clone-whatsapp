<template>
  <div class="container">
    <div class="carte">
        <h3 class="text-2xl mb-6">Inscrivez vous</h3>
        <br>
        <form @submit.prevent="signup">
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
          <b-button variant="outline-success" type="submit" >Sign Up</b-button>
              <br>
              <br>
          <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
          <br>
        </form>
    </div>
  </div>
</template>

<script>
import services from '../services/user.js'
export default {
  name: 'Signup',
  data () {
    return {
      phone_number: '',
      name: '',
      last_name: '',
      error: ''
    }
  },
  created () {
    this.checkedSignedUp()
  },
  updated () {
    this.checkedSignedUp()
  },
  methods: {
    signup () {
      services
        .signup(this.phone_number, this.name, this.last_name)
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.token = response.data.token
      localStorage.signedUp = true
      this.error = ''
      this.$router.replace('/messages')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Quelque chose ne va pas...'
      delete localStorage.csrf
      delete localStorage.signedUp
    },
    checkedSignedUp () {
      if (localStorage.signedUp) {
        this.$router.replace('/messages')
      }
    }
  }
}
</script>
