//
//  JKHUser.h
//  Instagram
//
//  Created by Joon Hong on 10/26/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKHUser : NSObject

@property (nonatomic, copy) NSString *bio;
@property (nonatomic, strong) NSNumber *followedByCount;
@property (nonatomic, strong) NSNumber *followsCount;
@property (nonatomic, strong) NSNumber *mediaCount;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, copy) NSString *profilePictureURL;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *website;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
