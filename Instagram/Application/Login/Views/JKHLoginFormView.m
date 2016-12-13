//
//  JKHLoginFormView.m
//  Instagram
//
//  Created by Joon Hong on 10/5/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHLoginFormView.h"
#import "JKHLoginTextField.h"
#import "JKHLoginButton.h"

@interface JKHLoginFormView ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) JKHLoginButton *loginButton;
    
@end

@implementation JKHLoginFormView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor clearColor];
        self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_white"]];
        self.loginButton = [[JKHLoginButton alloc] initWithFrame:CGRectZero];
        
        [self.loginButton addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:self.logoImageView];
        [self addSubview:self.loginButton];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@120);
    }];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(-120);
        make.leading.equalTo(self.mas_leading).with.offset(100);
        make.trailing.equalTo(self.mas_trailing).with.offset(-100);
        make.height.equalTo(@50);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).with.offset(20);
        make.trailing.equalTo(self.mas_trailing).with.offset(-20);
        make.bottom.equalTo(self.mas_bottom);
    }];

}

#pragma mark - Actions

- (void)loginButtonTapped:(UIButton *)sender {
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(JKHLoginFormViewDelegate)]) {
        [self.delegate loginFormSubmitted];
    }
}

@end
