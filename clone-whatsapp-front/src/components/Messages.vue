<template>
  <ul>
    <li v-for="(message, index) in messages" v-bind:key="index">
      {{ message.name }} - {{ message.last_name }} - {{ message.phone_number }}
    </li>
  </ul>
</template>

<script>
import services from '../services/messages.js'
export default {
  name: 'Messages',
  data () {
    return {
      user: JSON.parse(localStorage.user),
      messages: [],
      contacts: [],
    }
  },
  created () {
    services
      .allContacts(this.user)
      .then(response => {
        console.log(response)
/*         this.messages = response.data.messages // example
        this.contacts =  */
      })
  }
}
</script>
