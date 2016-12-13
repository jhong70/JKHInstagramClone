//
//  JKHHTTPClient.h
//  Instagram
//
//  Created by Joon Hong on 10/26/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKHHTTPClient : NSObject

- (void)postWithRequest:(NSMutableURLRequest *)request completion: (void(^)(BOOL, id))completionBlock;
- (void)getWithRequest:(NSMutableURLRequest *)request completion: (void(^)(BOOL, id))completionBlock;
- (void)putWithRequest:(NSMutableURLRequest *)request completion: (void(^)(BOOL, id))completionBlock;

@end
