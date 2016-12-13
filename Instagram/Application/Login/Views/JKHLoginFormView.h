//
//  JKHLoginFormView.h
//  Instagram
//
//  Created by Joon Hong on 10/5/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKHLoginFormViewDelegate

@required
- (void)loginFormSubmitted;

@end

@interface JKHLoginFormView : UIView

@property (nonatomic, weak) NSObject<JKHLoginFormViewDelegate> *delegate;

@end
