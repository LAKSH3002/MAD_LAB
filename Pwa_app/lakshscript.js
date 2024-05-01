if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("./lakshsw1.js")
    .then((swreg) => {
      console.log("Service Worker successfully registered", swreg.scope);
    })
    .catch((error) => {
      console.log("Service worker not registered", error);
    });
}
