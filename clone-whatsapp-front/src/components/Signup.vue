<template>
  <div class="container">
    <div class="w-100 p-3 bg-secondary text-light">
      <div class="border p-10 border-grey-light shadow rounded">
        <h3 class="text-2xl mb-6 text-grey-darkest">Sign Up</h3>
        <form @submit.prevent="signup">
          <div class="text-red" v-if="error">{{ error }}</div>

          <div class="mb-6">
            <label for="phone_number" class="label">numéro de téléphone</label>
            <input type="phone_number" v-model="phone_number" class="input" id="phone_number" placeholder="06..">
          </div>

          <div class="mb-6">
            <label for="name" class="label">Prénom</label>
            <input type="name" v-model="name" class="input" id="name" placeholder="Prénom">
          </div>

          <div class="mb-6">
            <label for="last_name" class="label">Nom de famille</label>
            <input type="last_name" v-model="last_name" class="input" id="last_name" placeholder="Nom de famille">
          </div>
          <b-button variant="outline-dark" type="submit" >Sign Up</b-button>
              <br>
              <br>
          <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
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
      this.$http.plain.post('/signup', { phone_number: this.phone_number, name: this.name, last_name: this.last_name })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.signedUp = true
      this.error = ''
      this.$router.replace('/messages')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
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
