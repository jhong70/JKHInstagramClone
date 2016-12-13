//
//  InstagramAPI.m
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "InstagramAPI.h"

#define kInstagramAuthorizationURLFormat @"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token"

@interface InstagramAPI ()

@end

@implementation InstagramAPI

+ (instancetype)sharedInstance {
    static InstagramAPI *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[InstagramAPI alloc] init];
    });
    
    return sharedInstance;
}

+ (NSURL *)authorizationURL {
    NSString *encodedRedirectURI = [kInstagramAppRedirectURI stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *authURLString = [NSString stringWithFormat:kInstagramAuthorizationURLFormat, kInstagramAppClientID, encodedRedirectURI];
    NSURL *authURL = [NSURL URLWithString:authURLString];
    
    return authURL;
}

- (NSMutableURLRequest *)requestWithPath:(NSString *)path params:(NSDictionary<NSString *,id> *)params {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?access_token=%@", IG_BASE_URL, path, self.accessToken]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    return request;
}

#pragma mark - Public API

- (BOOL)hasAccessToken {
    if (self.accessToken) {
        return YES;
    }
    return NO;
}

- (BOOL)receivedAccessTokenWithURL:(NSURL *)url {
    
    if ([url.absoluteString containsString:kInstagramAppRedirectURI] && url.fragment && [url.fragment componentsSeparatedByString:@"="].count > 1) {
        self.accessToken = [[url.fragment componentsSeparatedByString:@"="] lastObject];
        
        return YES;
    }
    
    return NO;
}

- (void)getUserSelfWithCompletion:(void (^)(BOOL success, JKHUser *user))completionBlock {
    if (!self.accessToken) { return; }
    
    NSMutableURLRequest *request = [self requestWithPath:IG_USERS_SELF params:nil];
    
    [self getWithRequest:request completion:^(BOOL success, id data) {
        if (success) {
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSDictionary *outerData = (NSDictionary *)data;
                NSDictionary *innerData = outerData[@"data"];
                JKHUser *user = [[JKHUser alloc] initWithJSON:innerData];
                
                if (user) {
                    completionBlock(YES, user);
                    return;
                }
            }
            completionBlock(NO, nil);
        }
        
        completionBlock(NO, nil);
    }];
}

- (void)getSelfRecentMediaWithCompletion:(void (^)(BOOL success, NSArray<JKHMedia *> *media))completionBlock {
    if (!self.accessToken) { return; }
    
    NSMutableURLRequest *request = [self requestWithPath:IG_SELF_RECENT_MEDIA params:nil];
    
    [self getWithRequest:request completion:^(BOOL success, id data) {
        if (success) {
            if ([data isKindOfClass:[NSDictionary class]]) {
                NSDictionary *outerData = (NSDictionary *)data;
                NSDictionary *innerData = outerData[@"data"];
                NSMutableArray *mediaList = [NSMutableArray new];
                
                for (NSDictionary *mediaJSON in innerData) {
                    JKHMedia *media = [[JKHMedia alloc] initWithJSON:mediaJSON];
                    
                    [mediaList addObject:media];
                }
                completionBlock(YES, mediaList);
            }
            completionBlock(NO, nil);
        }
        
        completionBlock(NO, nil);
    }];
}

@end
