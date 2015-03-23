/**
 *
 * TwitterFacebookSharePlugin.m
 *
 * Gian Luca Dalla Torre <gianluca@gestionaleauto.com>
 * by GestionaleAuto.com - http://www.gestionaleauto.com
 *
 * Share directly to Facebook and Twitter using OS API if present.
 * Mainly written for iOS
 */

#import "TwitterFacebookSharePlugin.h"

@implementation TwitterFacebookSharePlugin

- (void)isFBAvailable:(CDVInvokedUrlCommand*)command {
    bool avail = [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:avail];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isTwitterAvailable:(CDVInvokedUrlCommand*)command {
    bool avail = [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:avail];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)shareWithTwitter:(CDVInvokedUrlCommand*)command{
    
    NSString *text = [command.arguments objectAtIndex:0];
    
    NSString *imageName = [command.arguments objectAtIndex:1];
    UIImage *image = nil;
    
    if (imageName) {
        if (![imageName isEqualToString:@""]){
            image = [UIImage imageNamed:imageName];
        }
    }
    
    NSString *urlString = [command.arguments objectAtIndex:2];
    NSURL *url = nil;
    
    if (urlString) {
        if  (![urlString isEqualToString:@""]){
            url = [NSURL URLWithString:urlString];
        }
    }
    
    SLComposeViewController *svc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [svc setInitialText: text];
    if (image){
        [svc addImage:image];
    }
    if (url){
        [svc addURL:url];
    }
    
    SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
        CDVPluginResult* pluginResult;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:FALSE];
                break;
            case SLComposeViewControllerResultDone:
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:TRUE];
                break;
        }
        
        [svc dismissViewControllerAnimated:YES completion:nil];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };
    
    [svc setCompletionHandler:completionHandler];
    
    [self.viewController presentViewController:svc animated:YES completion:nil];
    
}

- (void)shareWithFB:(CDVInvokedUrlCommand*)command{
    
    NSString *text = [command.arguments objectAtIndex:0];
    
    NSString *imageName = [command.arguments objectAtIndex:1];
    UIImage *image = nil;
    
    if (imageName) {
        if (![imageName isEqualToString:@""]){
            image = [UIImage imageNamed:imageName];
        }
    }
    
    NSString *urlString = [command.arguments objectAtIndex:2];
    NSURL *url = nil;
    
    if (urlString) {
        if  (![urlString isEqualToString:@""]){
            url = [NSURL URLWithString:urlString];
        }
    }
    
    SLComposeViewController *svc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [svc setInitialText: text];
    if (image){
        [svc addImage:image];
    }
    if (url){
        [svc addURL:url];
    }
    
    SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
        CDVPluginResult* pluginResult;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:FALSE];
                break;
            case SLComposeViewControllerResultDone:
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:TRUE];
                break;
        }
        
        [svc dismissViewControllerAnimated:YES completion:nil];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };
    
    [svc setCompletionHandler:completionHandler];
    
    [self.viewController presentViewController:svc animated:YES completion:nil];
}

@end