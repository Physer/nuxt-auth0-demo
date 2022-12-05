<template>
    <div>
        <h1>Secret page!</h1>
    </div>
</template>
  
<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
    name: 'AuthPage',
    middleware: ['auth']
})
</script>
  