export default defineEventHandler(() => {
    console.log("Returning hello world");
    return { message: "Hello world" };
  });