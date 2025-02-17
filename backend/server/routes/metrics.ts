import { Registry, collectDefaultMetrics } from "prom-client";

const register = new Registry();
collectDefaultMetrics({ register });

export default defineEventHandler(async (event) => {
  event.node.res.setHeader("Content-Type", "text/plain");  // 🔥 Forcer le bon format
  return register.metrics();
});
