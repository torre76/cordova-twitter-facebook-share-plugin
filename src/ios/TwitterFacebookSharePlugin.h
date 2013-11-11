/**
 *
 * TwitterFacebookSharePlugin.h
 *
 * Gian Luca Dalla Torre <gianluca@gestionaleauto.com>
 * by GestionaleAuto.com - http://www.gestionaleauto.com
 *
 * Share directly to Facebook and Twitter using OS API if present.
 * Mainly written for iOS
 */

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

#import <Social/Social.h>

@interface TwitterFacebookSharePlugin : CDVPlugin

- (void)isFBAvailable:(CDVInvokedUrlCommand*)command;

- (void)isTwitterAvailable:(CDVInvokedUrlCommand*)command;

- (void)shareWithTwitter:(CDVInvokedUrlCommand*)command;

- (void)shareWithFB:(CDVInvokedUrlCommand*)command;

@end