//
//  InstagramAPI.h
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKHHTTPClient.h"
#import "JKHUser.h"
#import "JKHMedia.h"

#define kInstagramAppClientID @"<YOUR CLIENT ID HERE>"
#define kInstagramAppRedirectURI @"<YOUR REDIRECT URL HERE>"

@interface InstagramAPI : JKHHTTPClient

@property (nonatomic, strong) NSString *accessToken;

+ (instancetype)sharedInstance;
+ (NSURL *)authorizationURL;

- (BOOL)hasAccessToken;
- (BOOL)receivedAccessTokenWithURL:(NSURL *)url;

- (void)getUserSelfWithCompletion:(void (^)(BOOL success, JKHUser *user))completionBlock;
- (void)getSelfRecentMediaWithCompletion:(void (^)(BOOL success, NSArray<JKHMedia *> *media))completionBlock;

@end
