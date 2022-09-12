<template>
  <div class="container">
    <div class="carte">
        <h3 class="text-2xl mb-6">Connexion</h3>
        <br>
        <form @submit.prevent="signin">
          <b-alert show variant="success" v-if="error">{{ error }}</b-alert>
          <br>
          <div class="mb-4">
            <label for="phone_number" class="label">Numéro de téléphone</label>
            <input type="phone_number" v-model="phone_number" class="input" id="phone_number" placeholder="06..">
          </div>
          <br>
          <div class="mb-4">
            <label for="name" class="label">Prénom</label>
            <input type="name" v-model="name" class="input" id="name" placeholder="Prénom">
          </div>
          <br>
          <div class="mb-4">
            <label for="last_name" class="label">Nom de famille</label>
            <input type="last_name" v-model="last_name" class="input" id="last_name" placeholder="Nom de famille">
          </div>
          <br>
          <b-button variant="outline-success" type="submit" >Sign In</b-button>
            <br>
            <br>
          <div><router-link to="/signup" class="link-grey">Sign up</router-link></div>
            <br>
        </form>
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
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signin () {
      services
        .signin(this.phone_number, this.name, this.last_name)
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
      this.error = 'Numéro de téléphone introuvable'
      this.$router.replace('/messages')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Numéro de téléphone introuvable'
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
<style>
.carte{
  background-color: #f4f1ee;
  border-radius: 25px;
  border: 1px solid white;
  margin: 16px;
  padding-top: 16px;
  width: auto;
  height: auto;
}

.link-grey{
  text-decoration: none;
  border: 1px solid green;
  border-radius: 10px;
  color: green;
  padding: 8px;
}
.link-grey:hover{
  text-decoration: none;
  border: 1px solid green;
  border-radius: 10px;
  background-color: green;
  color: white;
  padding: 8px;
}
.input{
  justify-content: right;
}
</style>
