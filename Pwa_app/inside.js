var my_first_cache_url = [
  "responsive-watches-website-mainindex.html",
  "/assets/css/style.css",
];
// change the path of files above and then use it

// creates a firing action when service worker gets install
// life cycle of service worker - registered, install, activated
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open("lakshcache").then((cache) => {
      return cache.addAll();
    })
  );
});

self.addEventListener("fetch", (event) => {
  event.respondWith(caches.match(event.request)).then((res) => {
    if (res) {
      return res;
    }
    return fetch(event.request);
  });
});
