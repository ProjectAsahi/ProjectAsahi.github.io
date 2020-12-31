'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/android-chrome-192x192.png": "ef3afca79ff66ba3cf80ce162d79854f",
"icons/android-chrome-512x512.png": "1506e3d91b20a4d400daddb7bb00e523",
"icons/favicon-32x32.png": "b0c559e0d6e4eca562f9831540085487",
"icons/apple-touch-icon.png": "5d9d9dcc7dcf07d1758412ac3608109f",
"icons/favicon-16x16.png": "0ee165b2767475c40fa58810b8e28e88",
"favicon.ico": "f5fcab15d5ccbc5fbd9030e971aa9207",
"manifest.json": "d3023b577b4330521f0aaac19eeb9edb",
"assets/packages/easy_localization/i18n/en-US.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/easy_localization/i18n/en.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/NOTICES": "caa7e0dff3863784243fae8929600ce1",
"assets/assets/fonts/CascadiaCode.ttf": "1b96654561abbeac56eff623e8971b53",
"assets/assets/images/vt_sm.png": "af52f075dc3f953211220bd01bdc049c",
"assets/assets/images/Aki/working.webp": "04a5d930af1626feda126fda042c12c3",
"assets/assets/images/Aki/pandorahearts.png": "41c2e4f2ccd75e77481421a2b58f2af6",
"assets/assets/images/Aki/pandorahearts.webp": "a531374e6a11daa3452eda6d502169d8",
"assets/assets/images/Aki/main_visual.png": "59223fa672c536ec8b751bbf85d67e8c",
"assets/assets/images/Aki/street.png": "010769d90fd70eaf62527a6581a4c728",
"assets/assets/images/Aki/bar_thumb.png": "c129fe9cfe565f5985a24c8b877495df",
"assets/assets/images/Aki/main_visual.webp": "81fe45ded6869517c8f47f6b6994f29a",
"assets/assets/images/Aki/icon.png": "2082e0cf33fb5c5e48d007d3ad06e15a",
"assets/assets/images/Aki/working_thumb.png": "f1b39dbb04e3db672657a85c093d8196",
"assets/assets/images/Aki/working.png": "1b5f082fd5d151746cc9560604bc6612",
"assets/assets/images/Aki/bar.png": "df98120c6097df82aeabce244b9038d4",
"assets/assets/images/Aki/pandorahearts_thumb.png": "bae867ee5911e34714d3a9fadad56be6",
"assets/assets/images/Aki/street_thumb.png": "f4924f5e52c8c4bf0f5f82baa8764b51",
"assets/assets/images/crepe.webp": "a839445eef226d012aa66d9c8a4ee647",
"assets/assets/images/cover.png": "9be2d630e84b5de8985d403bfdc08b10",
"assets/assets/images/sea.webp": "98b50f1df7c5173c08752c0c325cd590",
"assets/assets/images/vt_sm.webp": "42c118345675eea40d8653e63708036b",
"assets/assets/images/Asahi/avatar_3d.webp": "6b34234c74c78392ada7c70084242fc6",
"assets/assets/images/Asahi/gamming_thumb.png": "ebfe9a2210c345e6073460141664f1b9",
"assets/assets/images/Asahi/avatar_3d_thumb.png": "bbac084dd6e6d7659cafdebcb89bbcc2",
"assets/assets/images/Asahi/gamming.png": "cd3a1e99a62e443ad48a3552a45707e4",
"assets/assets/images/Asahi/cooking.webp": "b6b9ad346d16b1ed89f897a13e43c599",
"assets/assets/images/Asahi/cookie.png": "629be797a632389e434b2b3f52f605e5",
"assets/assets/images/Asahi/gamming.webp": "d9eda2e121328e9094623561bed69db5",
"assets/assets/images/Asahi/swimming_thumb.png": "4c1c2166dc656c7d18837f56e3f975e2",
"assets/assets/images/Asahi/main_visual.png": "d1d85bf8ddf9db1c8b720a649f5ae858",
"assets/assets/images/Asahi/main_visual.webp": "ef6f5db535b53f66faf793d64559a08b",
"assets/assets/images/Asahi/cooking.png": "4804483df4930a0338759a8a458e7021",
"assets/assets/images/Asahi/live.png": "f333164feeae9a3953e3dda2b31bfe49",
"assets/assets/images/Asahi/live.webp": "27b4d2d06b4a6d675478dcc69961444e",
"assets/assets/images/Asahi/icon.jpg": "ce5f6269a08d0c498aedb16677b31f11",
"assets/assets/images/Asahi/avatar_3d.png": "343cd36d9ef0ce5b1f5c9e31a9206730",
"assets/assets/images/Asahi/swimming.png": "8398da614a20be7acf7e3c061ee90efc",
"assets/assets/images/Asahi/cooking_thumb.png": "9008d0ab7ae38a546964a77a411a07f7",
"assets/assets/images/Asahi/swimming.webp": "6099b016c1d4d1cb4c79e88ad72243d8",
"assets/assets/images/Asahi/cookie_thumb.png": "539bb6472e7c76a08b824bc95aa39828",
"assets/assets/images/Asahi/live_thumb.png": "4806ee19db24b388751e4bda66f41d19",
"assets/assets/images/Asahi/cookie.webp": "f79ba2e3ffccb7defeb3fdeb133602df",
"assets/assets/images/sea_thumb.png": "730d97da5ed37751872b2d9f9f0f9cd9",
"assets/assets/images/Yi/girl.webp": "b64a3845602776868b78ed90367e0b7f",
"assets/assets/images/Yi/boy_thumb.png": "43c917e6322ef6c78fd61e41dab76f93",
"assets/assets/images/Yi/chibi.png": "e9924069c33c774da70da452f86a08d0",
"assets/assets/images/Yi/main_visual.png": "a6294a16e8f2d5acee131e9bb666f5af",
"assets/assets/images/Yi/boy.webp": "6d3e2c4333ef55eda6f3499a2dc77510",
"assets/assets/images/Yi/girl_thumb.png": "888f9788ca77ecbb746eb9574dff3966",
"assets/assets/images/Yi/main_visual.webp": "7b984475ca18fc86bf83ad6e85037756",
"assets/assets/images/Yi/icon.png": "e77b355ad94bc64e4a04db47016dc62e",
"assets/assets/images/Yi/girl.png": "66c89928069ab84c3e9eb8d1b49fc122",
"assets/assets/images/Yi/icon.webp": "ddd99cc444e5ffe765f541e274c17fa1",
"assets/assets/images/Yi/boy.png": "d17daa8ec4db77b029ff9e02e6ec281b",
"assets/assets/images/Yi/chibi_thumb.png": "cf8d2d22287237476463c2a77821eebc",
"assets/assets/images/bilibili.png": "1093b9e87efa435391bdb7f537b3a92a",
"assets/assets/images/crepe.png": "cad08518f32e527da0443245a3ac9b5d",
"assets/assets/images/crepe_thumb.png": "409499d4a1a09b8182708ad622a8e2b4",
"assets/assets/images/logo.png": "b1a14ecfe3105a5a04581fbc3ade9a9e",
"assets/assets/images/logo.webp": "c201bbac1cdf488713445711ffefba7e",
"assets/assets/images/cover_sm.webp": "a796445cb260807eadcb4174df073973",
"assets/assets/images/cover_sm.png": "601bdb925315b5dc431d12e9cbd8bdcc",
"assets/assets/images/sea.png": "0dbc95610e709297568c6d18dea7b6b8",
"assets/assets/images/vt.webp": "feb60c797d7bc7b753c17a74a7ad3caf",
"assets/assets/images/Tesla/icon_2.webp": "01f27ddfda9fff3f9892e046aa58be50",
"assets/assets/images/Tesla/icon_3_thumb.png": "4eb2d19ed246e3df93c35b5138f2d9b2",
"assets/assets/images/Tesla/icon_1.webp": "d0597c50e7924d7da269f2f274959f83",
"assets/assets/images/Tesla/icon_3.png": "cad9531732bb73105fc576052e742646",
"assets/assets/images/Tesla/icon_2.png": "ec25a24f44056bf0fbdb3800135106c0",
"assets/assets/images/Tesla/main_visual.png": "c15b4bc74cfbaa9eaeecfcefa4bcc32d",
"assets/assets/images/Tesla/yuki_thumb.png": "a962ddcfc3649817556594c4ff80a54a",
"assets/assets/images/Tesla/main_visual.webp": "c8126de34345cf65921097f687b5bba8",
"assets/assets/images/Tesla/icon_1.png": "773b858985bb65fbed12a97a0c65efdf",
"assets/assets/images/Tesla/icon_3.webp": "d6a4250d02cd543a214f96d3de515312",
"assets/assets/images/Tesla/icon.png": "265014086b95614abb1a7c0f4dcda1eb",
"assets/assets/images/Tesla/icon_2_thumb.png": "894574de06008fed8ed228c6bc3432e5",
"assets/assets/images/Tesla/yuki.png": "ab9a06f645dbeb4abefc199c3809b233",
"assets/assets/images/Tesla/yuki.webp": "a3007e3ff60e20dd9ad5c34361811c7f",
"assets/assets/images/Tesla/icon_1_thumb.png": "45d563048ce3ab2cd2f5022d2770e04c",
"assets/assets/images/cover.webp": "9b0a59126eee1c1efca86e53c559e876",
"assets/assets/images/trap.webp": "88ca26f70f1a66b19012a24c97e85699",
"assets/assets/images/vt.png": "e0f443fa19d952135b842ae9f5d390fe",
"assets/assets/images/trap.png": "d88ff5f4363d3011b11ffe7f0e316b91",
"assets/assets/translations/en.json": "c36713826d7455811e8cdf7913dd8afb",
"assets/assets/translations/ja.json": "4e428941a88f43345126ed6b5347142c",
"assets/assets/translations/zh.json": "27b13ca0b7bef522c774ebc12d8dbe13",
"assets/AssetManifest.json": "2564348e997bf270cd6cfd23bc8c5fdb",
"assets/FontManifest.json": "210178c14fecb5c74d389b58107ed248",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"index.html": "a16e93fa618b6f3e76feb0d091e46b40",
"/": "a16e93fa618b6f3e76feb0d091e46b40",
"version.json": "1d19d95ad5b669bee1bc817a94d44e9c",
"main.dart.js": "daca4aacc72ad3e46804ee3a6d54c538",
"CNAME": "98193d9fd2c60b449cc4dae91cfb5cf0"
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
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
