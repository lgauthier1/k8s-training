// https://nitro.unjs.io/config
export default defineNitroConfig({
  srcDir: "server",
  compatibilityDate: "2025-02-15",
  routeRules: {
    '/**': { cors: true }, // Active CORS pour toutes les routes
  },
  server: {
    host: "0.0.0.0", // 🔥 Permet à Nitro d'être accessible depuis d'autres conteneurs
    port: 3000
  }
});
