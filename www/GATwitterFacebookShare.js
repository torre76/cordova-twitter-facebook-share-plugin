/**
 *
 * GATwitterFacebookShare.js
 *
 * Gian Luca Dalla Torre <gianluca@gestionaleauto.com>
 * by GestionaleAuto.com - http://www.gestionaleauto.com
 *
 * Share directly to Facebook and Twitter using OS API if present.
 * Mainly written for iOS
 */

function GATwitterFacebookShare(){
	// Init function, doing nothing here
};

GATwitterFacebookShare.prototype.isFBAvailable = function(callback) {
	cordova.exec(function(avail) {
		callback(avail ? true : false);
	}, null, "TwitterFacebookSharePlugin", "isFBAvailable", []);
};

GATwitterFacebookShare.prototype.isTwitterAvailable = function(callback) {
	cordova.exec(function(avail) {
		callback(avail ? true : false);
	}, null, "TwitterFacebookSharePlugin", "isTwitterAvailable", []);
};

GATwitterFacebookShare.prototype.shareWithFB = function(message, url, image, callback) {
    cordova.exec(function(success){
        callback(success ? true : false);
    }, null, "TwitterFacebookSharePlugin", "shareWithFB", [message, image, url]);
};

GATwitterFacebookShare.prototype.shareWithTwitter = function(message, url, image, callback) {
    cordova.exec(function(success){
        callback(success ? true : false);
    }, null, "TwitterFacebookSharePlugin", "shareWithTwitter", [message, image, url]);
};

// Installing plugin
if (!window.plugins) {
	window.plugins = {};	
}

window.plugins.GATwitterFacebookShare = new GATwitterFacebookShare();