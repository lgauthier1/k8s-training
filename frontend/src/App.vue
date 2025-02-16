<script setup>
import { ref, computed } from 'vue';
import NavTop from './components/NavTop.vue';

const API_URL = import.meta.env.VITE_API_URL;
const apiCalls = ref([]);
const intervalMs = ref(1000);
const selectedApi = ref('/hello');
const intervalId = ref(null);

// Fonction pour récupérer les données API
const fetchApiData = async () => {
  const url = `${API_URL}${selectedApi.value}`;
  const startTime = performance.now();
  const launchDate = new Date();

  try {
    const response = await fetch(url);
    const data = await response.json();
    const endTime = performance.now();
    const timeTaken = (endTime - startTime).toFixed(2);

    apiCalls.value.unshift({
      call: url,
      response: JSON.stringify(data, null, 2),
      time: timeTaken,
      date: launchDate.toLocaleString()
    });
  } catch {
    apiCalls.value.unshift({
      call: url,
      response: '❌ Erreur lors du chargement',
      time: 'N/A',
      date: launchDate.toLocaleString()
    });
  }
};

// Fonction pour démarrer/arrêter l'exécution automatique
const toggleAutoFetch = () => {
  if (intervalId.value) {
    clearInterval(intervalId.value);
    intervalId.value = null;
  } else {
    intervalId.value = setInterval(fetchApiData, intervalMs.value);
  }
};

// Fonction pour vider le tableau
const clearApiCalls = () => {
  apiCalls.value = [];
};

// Calcul des KPI
const kpiTotalCalls = computed(() => apiCalls.value.length);
const kpiTimes = computed(() => {
  const times = apiCalls.value
    .map(call => parseFloat(call.time))
    .filter(time => !isNaN(time));

  return {
    min: times.length ? Math.min(...times).toFixed(2) + " ms" : "-",
    max: times.length ? Math.max(...times).toFixed(2) + " ms" : "-",
    avg: times.length ? (times.reduce((a, b) => a + b, 0) / times.length).toFixed(2) + " ms" : "-"
  };
});
</script>

<template>
  <div class="flex flex-col bg-white min-h-screen">
    <NavTop />

    <main class="flex flex-col items-center p-6 w-full h-[calc(100vh-60px)]">
      <!-- Titre + Bouton Clear -->
      <div class="w-full max-w-4xl flex justify-between items-center mb-4">
        <h2 class="text-xl font-bold text-gray-700">Trigger API</h2>
        <button v-if="!intervalId" @click="clearApiCalls" class="bg-red-600 hover:bg-red-700 text-white px-4 py-1 rounded shadow">
          Clear
        </button>
      </div>

      <!-- Formulaire -->
      <div class="flex items-center gap-4 bg-gray-100 p-3 rounded-lg shadow-md w-full max-w-4xl">
        <label class="text-sm font-medium text-gray-700">Interval (ms):</label>
        <input v-model="intervalMs" type="number" min="500" class="w-20 p-1 border rounded">

        <label class="text-sm font-medium text-gray-700">API:</label>
        <select v-model="selectedApi" class="p-1 border rounded">
          <option value="/hello">Hello</option>
          <option value="/heavyComputation">heavyComputation</option>
        </select>

        <button @click="toggleAutoFetch"
          :class="intervalId ? 'bg-red-600 hover:bg-red-700' : 'bg-green-600 hover:bg-green-700'"
          class="text-white px-4 py-1 rounded shadow">
          {{ intervalId ? 'Arrêter' : 'Démarrer' }}
        </button>
      </div>

      <!-- KPI Section (1 ligne) -->
      <div class="w-full max-w-4xl bg-gray-50 p-3 rounded-lg shadow-md mt-6">
        <h3 class="text-lg font-bold text-gray-700 mb-2">Statistiques API</h3>
        <div class="grid grid-cols-4 gap-4 text-center">
          <div class="p-1 bg-white border rounded shadow">
            <p class="text-xs font-medium text-gray-600">Total</p>
            <p class="text-base font-bold text-blue-600">{{ kpiTotalCalls }}</p>
          </div>
          <div class="p-1 bg-white border rounded shadow">
            <p class="text-xs font-medium text-gray-600">Min</p>
            <p class="text-base font-bold text-blue-600">{{ kpiTimes.min }}</p>
          </div>
          <div class="p-1 bg-white border rounded shadow">
            <p class="text-xs font-medium text-gray-600">Max</p>
            <p class="text-base font-bold text-blue-600">{{ kpiTimes.max }}</p>
          </div>
          <div class="p-1 bg-white border rounded shadow">
            <p class="text-xs font-medium text-gray-600">Moyenne</p>
            <p class="text-base font-bold text-blue-600">{{ kpiTimes.avg }}</p>
          </div>
        </div>
      </div>

      <!-- Titre du tableau -->
      <div class="w-full max-w-4xl mt-6">
        <h3 class="text-lg font-bold text-gray-700">Résultats des appels API</h3>
      </div>

      <!-- Tableau avec scroll -->
      <div class="w-full max-w-4xl overflow-auto flex-grow border border-gray-300 mt-2">
        <table class="w-full border-collapse text-xs text-black"> <!-- Texte réduit -->
          <thead class="bg-blue-600 text-white sticky top-0 z-10">
            <tr>
              <th class="p-1 border">Date</th> <!-- Padding réduit -->
              <th class="p-1 border">API</th>
              <th class="p-1 border">Response</th>
              <th class="p-1 border">Temps</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(call, index) in apiCalls" :key="index" class="bg-gray-50 odd:bg-white text-center text-xs">
              <td class="p-1 border">{{ call.date }}</td>
              <td class="p-1 border">{{ call.call }}</td>
              <td class="p-1 border text-left ">
                <pre class="whitespace-pre-wrap">{{ call.response }}</pre>
              </td>
              <td class="p-1 border">{{ call.time }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      
    </main>
  </div>
</template>

<style>
html, body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  font-family: Arial, sans-serif;
  background-color: white;
  overflow: hidden;
}

/* Scrollbar stylisée */
::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 4px;
}
::-webkit-scrollbar-thumb:hover {
  background: #555;
}
::-webkit-scrollbar-track {
  background: #f1f1f1;
}
</style>
