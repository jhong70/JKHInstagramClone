//
//  JKHMedia.h
//  Instagram
//
//  Created by Joon Hong on 10/27/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKHUser.h"
#import "JKHMediaCaption.h"
#import <IGListKit/IGListKit.h>

@interface JKHMedia : NSObject <IGListDiffable>

@property (nonatomic, copy) NSString *attribution;
@property (nonatomic, strong) JKHMediaCaption *caption;
@property (nonatomic, strong) NSNumber *commentCount;
@property (nonatomic, strong) NSDate *createdTime;
@property (nonatomic, copy) NSString *filter;
@property (nonatomic, strong) NSString *mediaId;
@property (nonatomic, copy) NSString *lowResImageURL;
@property (nonatomic, copy) NSString *standardResImageURL;
@property (nonatomic) double imageAspectRatio;
@property (nonatomic, copy) NSString *thumbnailImageURL;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) JKHUser *user;
@property (nonatomic, strong) NSNumber *userHasLikedCount;
@property (nonatomic, strong) NSArray *usersInPhoto;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
