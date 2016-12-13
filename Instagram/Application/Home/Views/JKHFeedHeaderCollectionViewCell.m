//
//  JKHFeedHeaderCollectionViewCell.m
//  Instagram
//
//  Created by Joon Hong on 10/28/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedHeaderCollectionViewCell.h"

@interface JKHFeedHeaderCollectionViewCell ()

@property (nonatomic, strong) UIImageView *profilePictureImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIView *bottomBorderView;

@end

@implementation JKHFeedHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.profilePictureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile-avatar-icon"]];
        self.usernameLabel = [[UILabel alloc] init];
        self.moreButton = [[UIButton alloc] init];
        self.bottomBorderView = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.profilePictureImageView.layer.cornerRadius = 15.0;
        self.profilePictureImageView.clipsToBounds = YES;
        [self.profilePictureImageView setContentMode:UIViewContentModeScaleAspectFill];
        
        [self.usernameLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightBold]];
        [self.usernameLabel setTextColor:[UIColor blackColor]];
        
        [self.moreButton setImage:[UIImage imageNamed:@"more-icon"] forState:UIControlStateNormal];
        [self.moreButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self.bottomBorderView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
        
        [self addSubview:self.profilePictureImageView];
        [self addSubview:self.usernameLabel];
        [self addSubview:self.moreButton];
        [self addSubview:self.bottomBorderView];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}


- (void)updateConstraints {
    
    [self removeConstraints:[self constraints]];
    
    [self.profilePictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing);
        make.height.equalTo(self.profilePictureImageView.mas_height);
        make.width.equalTo(@40);
        make.centerY.equalTo(self.profilePictureImageView.mas_centerY);
    }];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.profilePictureImageView.mas_trailing).offset(10);
        make.top.equalTo(self.profilePictureImageView.mas_top);
        make.bottom.equalTo(self.profilePictureImageView.mas_bottom);
        make.centerY.equalTo(self.profilePictureImageView.mas_centerY);
        make.trailing.equalTo(self.moreButton.mas_leading);
    }];
    
    [self.bottomBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.width.equalTo(self.mas_width);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [super updateConstraints];
}

#pragma mark - Public API

- (void)setMedia:(JKHMedia *)media {
    NSURL *profilePictureURL = [NSURL URLWithString:media.user.profilePictureURL];
    
    if (profilePictureURL) {
        [self.profilePictureImageView sd_setImageWithURL:profilePictureURL];
    }
    
    self.usernameLabel.text = media.user.username;
    [self.usernameLabel sizeToFit];
}

@end
