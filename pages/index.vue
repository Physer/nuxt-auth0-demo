<template>
  <div>
    <h1>Welcome</h1>
    <NuxtLink to="/login">To the login page!</NuxtLink>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'IndexPage'
})
</script>
