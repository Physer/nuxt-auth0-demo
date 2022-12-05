<template>
  <div>
    <h1>Welcome</h1>
    <a href="#" @click="$auth.login()">To the login page!</a>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'IndexPage'
})
</script>
