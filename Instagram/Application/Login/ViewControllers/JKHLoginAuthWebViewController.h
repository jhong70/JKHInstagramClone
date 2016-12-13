//
//  JKHLoginAuthWebViewController.h
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKHLoginAuthWebDelegate <NSObject>

@required
- (void)loginAuthWebControllerDidSucceedWithToken:(NSString *)token;

@end

@interface JKHLoginAuthWebViewController : UIViewController

@property (nonatomic, weak) id<JKHLoginAuthWebDelegate> delegate;

@end
