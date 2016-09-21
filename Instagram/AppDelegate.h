//
//  AppDelegate.h
//  Instagram
//
//  Created by Joon Hong on 9/21/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

