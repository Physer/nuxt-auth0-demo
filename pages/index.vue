<template>
  <div>
    <h1>Welcome {{ $auth?.user?.given_name }}</h1>
    <a href="#" @click="$auth.loginWith('auth0')">To the login page!</a>
    <br />
    <NuxtLink v-if="$auth.loggedIn" to="/authenticated">Go to the page for authenticated users</NuxtLink>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'IndexPage'
})
</script>
