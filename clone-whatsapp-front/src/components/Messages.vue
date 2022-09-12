<template>
  <div class="container">
    <br>
    <h3> Bonjour {{user.name}} {{user.last_name}}</h3>
    <br>
    <ul>
      <li v-for="(message, index) in messages" v-bind:key="index">
      {{ user.name}} {{ user.last_name}}  =  {{ message.text }}
      </li>
    </ul>
</div>
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
        this.messages = response.data
      })
  }
}
</script>

<style>
  li {
    list-style-type: none;
  }

</style>
