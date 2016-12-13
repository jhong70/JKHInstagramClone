//
//  JKHHomeNavigationController.m
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHHomeNavigationController.h"
#import "JKHFeedViewController.h"

@interface JKHHomeNavigationController ()

@end

@implementation JKHHomeNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViewControllers:@[[[JKHFeedViewController alloc] init]]];
    
    [self setupTabBarItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - Setup

- (void)setupTabBarItems {
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"home-icon"] tag:0];
        
    self.tabBarItem = tabBarItem;
}



@end
