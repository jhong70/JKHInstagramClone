//
//  JKHLoginButton.m
//  Instagram
//
//  Created by Joon Hong on 10/4/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHLoginButton.h"

@implementation JKHLoginButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = LOGIN_ELEMENT_CORNERRADIUS;
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setTitle:NSLocalizedString(@"loginButtonTitle", @"Log In") forState:UIControlStateNormal];

    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
    }];
}

@end
