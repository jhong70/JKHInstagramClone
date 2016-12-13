//
//  JKHMainTabBarViewController.m
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHMainTabBarViewController.h"
#import "JKHHomeNavigationController.h"

@interface JKHMainTabBarViewController ()

@end

@implementation JKHMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    
    [vcs addObject:[[JKHHomeNavigationController alloc] init]];
    
    self.viewControllers = [vcs mutableCopy];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Remove the titles and adjust the inset to account for missing title
    for(UITabBarItem * tabBarItem in self.tabBar.items){
        tabBarItem.title = @"";
        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
