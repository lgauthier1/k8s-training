function heavyComputation() {
  let total = 0;
  for (let i = 0; i < 1e9; i++) {
    total += Math.sqrt(i);
  }
  return total;
}

export default defineEventHandler(() => {
  console.log("Returning heavy computation result");
  return { result: heavyComputation() };
});