<script setup>
import { ref, onMounted } from 'vue';

const message = ref('Chargement...');
const API_URL = import.meta.env.VITE_API_URL;

onMounted(async () => {
  try {
    const response = await fetch(`${API_URL}/hello`)
    const data = await response.json();
    message.value = data.message;
  } catch (error) {
    message.value = 'Erreur lors du chargement';
  }
});
</script>

<template>
  <div class="container">
    <h1>{{ message }}</h1>
  </div>
</template>

<style>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: Arial, sans-serif;
}
</style>