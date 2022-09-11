<template>
  <ul>
    <li v-for="(message, index) in messages" v-bind:key="index">
      {{ message.text }}
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
      contacts: []
    }
  },
  created () {
    services
      .allContacts(this.user)
      .then(response => {
        this.messages = response.data // example
        // this.chats =
      })
  }
}
</script>
