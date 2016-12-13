//
//  JKHMediaCaption.m
//  Instagram
//
//  Created by Joon Hong on 10/28/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHMediaCaption.h"

@interface JKHMediaCaption ()

@property (nonatomic, strong) NSNumber *createdTime;
@property (nonatomic, strong) JKHUser *fromUser;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, copy) NSString *text;

@end

@implementation JKHMediaCaption

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        NSArray *keys = [json allKeys];
        
        if ([keys containsObject:@"created_time"]) {
            self.createdTime = (NSNumber *)[json objectForKey:@"created_time"];
        }
        
        if ([keys containsObject:@"from"]) {
            self.fromUser = [[JKHUser alloc] initWithJSON:(NSDictionary *)[json objectForKey:@"from"]];
        }
        
        if ([keys containsObject:@"id"]) {
            self.userId = (NSNumber *)[json objectForKey:@"id"];
        }
        
        if ([keys containsObject:@"text"]) {
            self.text = (NSString *)[json objectForKey:@"text"];
        }
    }
    
    return self;
}

@end
