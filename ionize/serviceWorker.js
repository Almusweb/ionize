
var CacheName = 'LiszkaiAdamBlog';

self.addEventListener('install', function(event)
{
	console.time('sw-install');
	
	event.waitUntil(
		
		caches.open( CacheName+'-common' ).then(cache =>
		{
			console.timeEnd('sw-install');
		})
	);
	
	console.log("serviceWorker Installed");
});

function cacheRequest( event )
{
	return caches.match(event.request).then(response =>
	{
		// Megtaláltam a CACHE-ben a kérést
		if (response) return response;
		
		// Lekérdezem ha mégsem, de ehhez klónoznom kell a kérést az egyedi azonosítója miatt
		var fetchRequest = event.request.clone();
		
		// Visszatérek a lekérés igéretével
		return fetch(fetchRequest).then(response =>
		{
			// Lemásolom a választ
			let responseToCache = response.clone();
			
			let cacheCategory = '-common';
			if( event.request.url.indexOf('assets/') >= 0 ) cacheCategory = '-assets';
			if( event.request.url.indexOf('components/') >= 0 ) cacheCategory = '-components';
			if( event.request.url.indexOf('components/iron-') >= 0 ) cacheCategory = '-iron-components';
			if( event.request.url.indexOf('components/paper-') >= 0 ) cacheCategory = '-paper-components';
			if( event.request.url.indexOf('controllers/') >= 0 ) cacheCategory = '-controllers';
			if( event.request.url.indexOf('elements/') >= 0 ) cacheCategory = '-elements';
			if( event.request.url.indexOf('templates/') >= 0 ) cacheCategory = '-templates';
			
			if( event.request.url.indexOf('elements/') >= 0 ) return response;
			if( event.request.url.indexOf('controllers/') >= 0 ) return response;
			if( event.request.url.indexOf('templates/') >= 0 ) return response;
			
			// Majd elmentem a CACHE-be
			caches.open( CacheName+cacheCategory ).then(cache => {
				cache.put(event.request, responseToCache);
			});
			
			return response;
		});
	});
}

self.addEventListener('fetch', function(event)
{
	//console.debug('serviceWorker::fetch:event', event);
	event.respondWith( cacheRequest( event ) );
});
