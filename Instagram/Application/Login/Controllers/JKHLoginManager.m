//
//  JKHLoginManager.m
//  Instagram
//
//  Created by Joon Hong on 10/27/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHLoginManager.h"
#import "JKHLoginAuthWebViewController.h"

@interface JKHLoginManager () <JKHLoginAuthWebDelegate>

@end

@implementation JKHLoginManager

- (instancetype)initWithDelegate:(id<JKHLoginManagerDelegate>)delegate {
    self = [super init];
    
    if (self) {
        self.delegate = delegate;
    }
    
    return self;
}

#pragma mark - Helpers

- (BOOL)delegateConformsToProtocol {
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(JKHLoginManagerDelegate)]) {
        return YES;
    }
    return NO;
}

#pragma mark - Public API

- (void)startLogin {
    if ([self delegateConformsToProtocol]) {
        JKHLoginAuthWebViewController *vc = [[JKHLoginAuthWebViewController alloc] init];
        vc.delegate = self;
        
        [self.delegate loginManagerRequestsViewControllerPresentation:vc];
    }
}

#pragma mark - JKHLoginAuthWebDelegate

- (void)loginAuthWebControllerDidSucceedWithToken:(NSString *)token {
    [[InstagramAPI sharedInstance] getUserSelfWithCompletion:^(BOOL success, JKHUser *user) {
        if (success) {
            APPDELEGATE.currentUser = user;
            if ([self delegateConformsToProtocol]) {
                [self.delegate loginManagerDidFinishLogin:YES user:user];
            }
        } else {
            [self.delegate loginManagerDidFinishLogin:NO user:nil];
        }
    }];
    
    
}


@end
