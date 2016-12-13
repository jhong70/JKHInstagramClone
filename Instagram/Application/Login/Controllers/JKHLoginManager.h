//
//  JKHLoginManager.h
//  Instagram
//
//  Created by Joon Hong on 10/27/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JKHLoginManagerDelegate <NSObject>

@required
- (void)loginManagerRequestsViewControllerPresentation:(UIViewController *)vc;
- (void)loginManagerDidFinishLogin:(BOOL)success user:(JKHUser *)user;

@end

@interface JKHLoginManager : NSObject

@property (nonatomic, weak) id<JKHLoginManagerDelegate> delegate;

- (instancetype)initWithDelegate:(id<JKHLoginManagerDelegate>)delegate;

- (void)startLogin;

@end
