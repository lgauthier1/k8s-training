<template>
    <nav class="fixed top-0 left-0 w-full bg-blue-600 shadow-md text-white py-4 px-6 flex items-center">
      <h1 class="text-2xl font-bold">K8S-TRAINING</h1>
    </nav>
  
    <!-- Espace pour éviter que le contenu soit caché sous la navbar -->
    <div class="pt-16">
      <slot />
    </div>
  </template>