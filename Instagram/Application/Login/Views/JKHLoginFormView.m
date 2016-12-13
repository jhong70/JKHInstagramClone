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
@property (nonatomic, strong) JKHLoginTextField *usernameTextField;
@property (nonatomic, strong) JKHLoginTextField *passwordTextField;
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
        self.usernameTextField = [[JKHLoginTextField alloc] initWithType:JKHLoginTextFieldTypeEmail];
        self.passwordTextField = [[JKHLoginTextField alloc] initWithType:JKHLoginTextFieldTypePassword];
        self.loginButton = [[JKHLoginButton alloc] initWithFrame:CGRectZero];
        
        self.usernameTextField.placeholder = @"Username";
        self.passwordTextField.placeholder = @"Password";
        [self.loginButton addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:self.logoImageView];
        [self addSubview:self.usernameTextField];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.loginButton];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).with.offset(-120);
        make.leading.equalTo(self.mas_leading).with.offset(100);
        make.trailing.equalTo(self.mas_trailing).with.offset(-100);
        make.height.equalTo(@50);
    }];
    
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoImageView.mas_bottom).with.offset(20);
        make.leading.equalTo(self.mas_leading).with.offset(20);
        make.trailing.equalTo(self.mas_trailing).with.offset(-20);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameTextField.mas_bottom).with.offset(10);
        make.leading.equalTo(self.usernameTextField.mas_leading);
        make.trailing.equalTo(self.usernameTextField.mas_trailing);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom).with.offset(20);
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
