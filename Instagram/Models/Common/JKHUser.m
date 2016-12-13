//
//  JKHUser.m
//  Instagram
//
//  Created by Joon Hong on 10/26/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHUser.h"

@interface JKHUser ()

@end

@implementation JKHUser

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        NSArray *keys = [json allKeys];
        
        if ([keys containsObject:@"bio"]) {
            self.bio = (NSString *)[json objectForKey:@"bio"];
        }
        
        if ([keys containsObject:@"counts"] && [json objectForKey:@"counts"]) {
            NSDictionary *counts = (NSDictionary *)[json objectForKey:@"counts"];
            NSArray *countKeys = [counts allKeys];
            
            if ([countKeys containsObject:@"followed_by"]) {
                self.followedByCount = (NSNumber *)[counts objectForKey:@"followed_by"];
            }
            
            if ([countKeys containsObject:@"follows"]) {
                self.followsCount = (NSNumber *)[counts objectForKey:@"follows"];
            }
            
            if ([countKeys containsObject:@"media"]) {
                self.mediaCount = (NSNumber *)[counts objectForKey:@"media"];
            }
        }
        
        if ([keys containsObject:@"full_name"]) {
            self.fullName = (NSString *)[json objectForKey:@"full_name"];
        }
        
        if ([keys containsObject:@"id"]) {
            self.userId = (NSNumber *)[json objectForKey:@"id"];
        }
        
        if ([keys containsObject:@"profile_picture"]) {
            self.profilePictureURL = (NSString *)[json objectForKey:@"profile_picture"];
        }
        
        if ([keys containsObject:@"username"]) {
            self.username = (NSString *)[json objectForKey:@"username"];
        }
        
        if ([keys containsObject:@"website"]) {
            self.website = (NSString *)[json objectForKey:@"website"];
        }
    }
    
    return self;
}


@end
