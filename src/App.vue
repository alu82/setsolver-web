<template>
  <SetSolver msg="Welcome to the set solver app."/>
</template>

<script>
import SetSolver from './components/SetSolver.vue'

export default {
  name: 'App',
  components: {
    SetSolver
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
