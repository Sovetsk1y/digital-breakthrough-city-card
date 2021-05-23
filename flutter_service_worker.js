'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "557a96fe7c8b66e9fd2ab157bef606b2",
"index.html": "01cf6b06b98ae191d1d883d79c28e43f",
"/": "01cf6b06b98ae191d1d883d79c28e43f",
"main.dart.js": "65539894c780c074fbeaea438fb66f2e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ab812f507533de4156a58082b485345e",
"assets/AssetManifest.json": "8d1bc214f8c3b68d02976d0e147fd2d7",
"assets/NOTICES": "f5a7461260c87bdde0c5bac7bce75e9e",
"assets/FontManifest.json": "06d217f4fb811152e6c8c34a5d212197",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/christian.png": "a185a0e1ec1fef61c578a7730309f1fc",
"assets/assets/images/qrcode.png": "d65331fe9755cdce3a66f334dd5b4fd2",
"assets/assets/images/2.0x/christian.png": "ff8951270b55a055b41730e68a5bdc66",
"assets/assets/images/2.0x/qrcode.png": "e471957b1176b4556b3d93a051c3cd07",
"assets/assets/images/2.0x/mts.png": "866b414dcbfae82b0775cf9efcd1c47a",
"assets/assets/images/2.0x/restaurant.png": "7fead4f7ca1b1ea376d2afa0f66c6488",
"assets/assets/images/2.0x/apple.png": "2326b32a4867def31d3ddf456873f9ed",
"assets/assets/images/2.0x/parking_icon.png": "af8a62d1b7318f0ca103d85792f480ea",
"assets/assets/images/2.0x/diamond.png": "d765f33ae470f97e10c916c3d00f6527",
"assets/assets/images/2.0x/geopoint.png": "89c79a07f2ce4960995321d3e90ffc4a",
"assets/assets/images/2.0x/google.png": "d062385d77b32d9c364527441ae4b039",
"assets/assets/images/2.0x/barcode.png": "f9db1dea48276a622db628d9a06388ae",
"assets/assets/images/2.0x/welcome_hand.png": "ebb17d7fb9724470e005b46af1f56ce5",
"assets/assets/images/mts.png": "3e70966e9d9c38db9c17e12c34827d0e",
"assets/assets/images/restaurant.png": "37fa78873f3601589cd1895cefcb4e7b",
"assets/assets/images/3.0x/christian.png": "35aa30af03b96189e61210a7d08190bf",
"assets/assets/images/3.0x/qrcode.png": "f7392272face0ee66484bf6d9f1e64f7",
"assets/assets/images/3.0x/mts.png": "5e155e3dd949abd9d7584a7fb17e0142",
"assets/assets/images/3.0x/restaurant.png": "91e4ecbf8d07386d2e098c9c85ff37ff",
"assets/assets/images/3.0x/apple.png": "d8eba1297388f69d9960227fd829201a",
"assets/assets/images/3.0x/parking_icon.png": "56b590d0a1dfbd6d61c1f8d54433104a",
"assets/assets/images/3.0x/diamond.png": "9f68fc5cb180ca182f17d3fd45b70c30",
"assets/assets/images/3.0x/geopoint.png": "80a2cfd7378f6aa07f265722b388e588",
"assets/assets/images/3.0x/google.png": "2c0a8530b77db777e9086f4b5eb7539f",
"assets/assets/images/3.0x/barcode.png": "78964c0fbd4f7f730b30726d531b929a",
"assets/assets/images/3.0x/welcome_hand.png": "f64fcb5dc376740b7f5feeb74177ec10",
"assets/assets/images/apple.png": "c080fbe27c850810bb3c8113cc5c868a",
"assets/assets/images/parking_icon.png": "5e1ec4be0c14ee3531f46308b9eafc1b",
"assets/assets/images/diamond.png": "21982dd70fe7a069a873af7dc7877c32",
"assets/assets/images/geopoint.png": "32e60154739fa9abe850948abaf86a3a",
"assets/assets/images/google.png": "6c50dd15a50e4d9b5d0448c72560de29",
"assets/assets/images/barcode.png": "eea54d9b0cfb48fe0917ca32c4074e8a",
"assets/assets/images/welcome_hand.png": "541b291e3da5885758c6dd02b5e7e17c",
"assets/assets/icons/sport.svg": "07ae9655db9b35c6273f0d8748fa1e45",
"assets/assets/icons/cafe.svg": "74aad8d56fc901f1c5fe81a1af47e342",
"assets/assets/icons/settings.svg": "14b5c3717332490d32a3929102eab98f",
"assets/assets/icons/card.svg": "3ec9f2f1c3c0b80828142814e7e50f1a",
"assets/assets/icons/culture.svg": "4036ec12ebb2f2da48b1df22a7c7e377",
"assets/assets/icons/chevron_down.svg": "40cf697de46850f970d203aca599ad27",
"assets/assets/icons/archieved.svg": "8b6c4bbd80060c6c6c0ecb14da35c534",
"assets/assets/icons/profile.svg": "5119120604d7073877e08b35775510ee",
"assets/assets/icons/wave.svg": "df08ada76c476398ed55d88596528d3d",
"assets/assets/icons/parking.svg": "54747f6f6b5780a482cba07f0451a06e",
"assets/assets/icons/double_wave.svg": "2231c1f8e18b49be921405161767eb19",
"assets/assets/icons/timer.svg": "7776dbca4643aac1019bc193a98ee69a",
"assets/assets/fonts/SF-Pro-Rounded-Semibold.otf": "02dc9f029efbbe4cd105420f50202dd9",
"assets/assets/fonts/SF-Pro-Rounded-Regular.otf": "6720e086a89d34cb9ca424a3ba913082",
"assets/assets/fonts/Arial-Regular.ttf": "fa3228aadde0db988e1822c2f736c131",
"assets/assets/fonts/SF-Pro-Text-Regular.otf": "a07152f3f0c03589a75b218b2c6536cb",
"assets/assets/fonts/SF-Pro-Text-Medium.otf": "ded5efe3e8ec62553c3b10f4edd4ca8d",
"assets/assets/fonts/SF-Pro-Rounded-Bold.otf": "bf108f8e2fcbda9e4ea2b18ed7799caf"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
