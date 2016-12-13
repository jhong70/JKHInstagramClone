//
//  JKHHTTPClient.m
//  Instagram
//
//  Created by Joon Hong on 10/26/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHHTTPClient.h"

@implementation JKHHTTPClient

- (void)dataTaskWithRequest:(NSMutableURLRequest *)request method:(NSString *)method completion: (void(^_Nullable)(BOOL, id))completionBlock {
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
    
    request.HTTPMethod = method;
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completionBlock(NO, nil);
            return;
        }
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSUInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
            
            if (statusCode != 200) {
                completionBlock(NO, nil);
                return;
            }
        }
        
        if (data) {
            NSError *parseError;
            id response = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (parseError) {
                completionBlock(NO, nil);
                return;
            } else if (response) {
                completionBlock(YES, response);
                return;
            }
        }
        
        completionBlock(YES, nil);
    }] resume];
    
}

- (void)postWithRequest:(NSMutableURLRequest *)request completion: (void(^)(BOOL, id))completionBlock {
    [self dataTaskWithRequest:request method:@"POST" completion:completionBlock];
}

- (void)getWithRequest:(NSMutableURLRequest *)request completion: (void(^)(BOOL, id))completionBlock {
    [self dataTaskWithRequest:request method:@"GET" completion:completionBlock];
}

- (void)putWithRequest:(NSMutableURLRequest *)request completion: (void(^)(BOOL, id))completionBlock {
    [self dataTaskWithRequest:request method:@"PUT" completion:completionBlock];
}


@end
