//
//  JKHMedia.m
//  Instagram
//
//  Created by Joon Hong on 10/27/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHMedia.h"

@interface JKHMedia ()

@end

@implementation JKHMedia

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        self.tags = @[];
        self.usersInPhoto = @[];
        
        NSArray *keys = [json allKeys];
        
        if ([keys containsObject:@"attribution"]) {
            self.attribution = (NSString *)[json objectForKey:@"attribution"];
        }
        
        if ([keys containsObject:@"caption"]) {
            NSDictionary *captionJSON = (NSDictionary *)[json objectForKey:@"caption"];
            if (captionJSON) {
                self.caption = [[JKHMediaCaption alloc] initWithJSON:captionJSON];
            }
        }
        
        if ([keys containsObject:@"comments"] && [json objectForKey:@"comments"]) {
            NSDictionary *comments = (NSDictionary *)[json objectForKey:@"comments"];
            NSArray *commentKeys = [comments allKeys];
            
            if ([commentKeys containsObject:@"count"]) {
                self.commentCount = (NSNumber *)[comments objectForKey:@"count"];
            }
        }
        
        if ([keys containsObject:@"created_time"]) {
            NSNumber *numberInterval = (NSNumber *)[json objectForKey:@"created_time"];
            NSTimeInterval timeInterval = [numberInterval doubleValue];
            self.createdTime = [NSDate dateWithTimeIntervalSince1970: timeInterval];
        }
        
        if ([keys containsObject:@"filter"]) {
            self.filter = (NSString *)[json objectForKey:@"filter"];
        }

        if ([keys containsObject:@"id"]) {
            self.mediaId = (NSString *)[json objectForKey:@"id"];
        }
        
        if ([keys containsObject:@"images"] && [json objectForKey:@"images"]) {
            NSDictionary *images = (NSDictionary *)[json objectForKey:@"images"];
            NSArray *imageKeys = [images allKeys];
            
            if ([imageKeys containsObject:@"low_resolution"]) {
                self.lowResImageURL = (NSString *)((NSDictionary *)[images objectForKey:@"low_resolution"])[@"url"];
            }
            
            if ([imageKeys containsObject:@"standard_resolution"]) {
                NSNumber *height = (NSNumber *)((NSDictionary *)[images objectForKey:@"standard_resolution"])[@"height"];
                NSNumber *width = (NSNumber *)((NSDictionary *)[images objectForKey:@"standard_resolution"])[@"width"];
                
                self.imageAspectRatio = [width floatValue] / [height floatValue];
                self.standardResImageURL = (NSString *)((NSDictionary *)[images objectForKey:@"standard_resolution"])[@"url"];
            }
            
            if ([imageKeys containsObject:@"thumbnail"]) {
                self.thumbnailImageURL = (NSString *)((NSDictionary *)[images objectForKey:@"thumbnail"])[@"url"];
            }
        }
        
        if ([keys containsObject:@"likes"] && [json objectForKey:@"likes"]) {
            NSDictionary *likes = (NSDictionary *)[json objectForKey:@"likes"];
            NSArray *likeKeys = [likes allKeys];
            
            if ([likeKeys containsObject:@"count"]) {
                self.likeCount = (NSNumber *)[likes objectForKey:@"count"];
            }
        }
        
        if ([keys containsObject:@"link"]) {
            self.link = (NSString *)[json objectForKey:@"link"];
        }
        
        if ([keys containsObject:@"location"]) {
            self.location = (NSString *)[json objectForKey:@"location"];
        }
        
        if ([keys containsObject:@"type"]) {
            self.type = (NSString *)[json objectForKey:@"type"];
        }
        
        if ([keys containsObject:@"user"]) {
            NSDictionary *userJSON = (NSDictionary *)[json objectForKey:@"user"];
            self.user = [[JKHUser alloc] initWithJSON:userJSON];
        }
        
        if ([keys containsObject:@"user_has_liked"]) {
            self.userHasLikedCount = (NSNumber *)[json objectForKey:@"user_has_liked"];
        }
    }
    
    return self;
}

#pragma mark - IGListDiffable

- (id<NSObject>)diffIdentifier {
    return self.mediaId;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    JKHMedia *media = (JKHMedia *)object;
    
    if (media && [self.mediaId isEqual:media.mediaId]) {
        return YES;
    }
    return NO;
}

- (BOOL)isEqual:(id<IGListDiffable>)object {
    JKHMedia *media = (JKHMedia *)object;
    
    if (media && [self.mediaId isEqual:media.mediaId]) {
        return YES;
    }
    return NO;
}

@end
