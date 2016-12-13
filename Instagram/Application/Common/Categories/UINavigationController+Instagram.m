//
//  UINavigationController+Instagram.m
//  Instagram
//
//  Created by Joon Hong on 10/29/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "UINavigationController+Instagram.h"

@implementation UINavigationController (Instagram)

- (void)addOpaqueStatusBarBackgroundWithColor: (UIColor *)color {
    UIView *statusBarBackgroundView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].statusBarFrame];
    
    statusBarBackgroundView.tag = 1337;
    [statusBarBackgroundView setBackgroundColor:color];
    
    [self.view addSubview:statusBarBackgroundView];
}

- (void)removeOpaqueStatusBarBackground {
    UIView *statusBarBackground = [self.view viewWithTag:1337];
    
    [statusBarBackground removeFromSuperview];
}

@end
