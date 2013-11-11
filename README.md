cordova-twitter-facebook-share
==============================

Phonegap 3.x Twitter and Facebook sharing system

Installation
------------

To install this plugin simply use:

```Shell
cordova plugin add https://github.com/torre76/cordova-twitter-facebook-share-plugin
```

or, if you use _Phonegap_:

```Shell
phonegap local plugin add https://github.com/torre76/cordova-twitter-facebook-share-plugin
```
 Usage
 -----
 
 Once installed, available function are:

 ```js
 isFBAvailable(callback) // Check if Facebook iOS share is available. Callback function receive a boolean
 ```
 ```js
 isTwitterAvailable(callback) // Check if Twitter iOS share is available. Callback function receive a boolean
 ```
 ```js
 shareWithFB (message, url, image, callback) // Share a message with FB (url, image and callback are optionals) and receive a boolean in callback (true if share is complete succesfully)
 ```
 ```js
 shareWithTwitter (message, url, image, callback) // Share a message with Twitter (url, image and callback are optionals) and receive a boolean in callback (true if share is complete succesfully)
 ```

 All this function are available under

```js
window.plugins.GATwitterFacebookShare
 ```

 iOS only
 --------

 Since this plugin uses features that are available only on iOS, it is meant to be used on Apple only.
