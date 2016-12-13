//
//  JKHFeedActionCollectionViewCell.m
//  Instagram
//
//  Created by Joon Hong on 10/29/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedActionCollectionViewCell.h"

@interface JKHFeedActionCollectionViewCell ()

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *replyButton;
@property (nonatomic, strong) UIView *bottomBorderView;

@end

@implementation JKHFeedActionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.likeButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.commentButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.replyButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.bottomBorderView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self.likeButton setImage:[UIImage imageNamed:@"like-icon"] forState:UIControlStateNormal];
        [self.commentButton setImage:[UIImage imageNamed:@"comment-icon"] forState:UIControlStateNormal];
        [self.replyButton setImage:[UIImage imageNamed:@"reply-icon"] forState:UIControlStateNormal];
        [self.bottomBorderView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
        
        [self.likeButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.commentButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.replyButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self addSubview:self.likeButton];
        [self addSubview:self.commentButton];
        [self addSubview:self.replyButton];
        [self addSubview:self.bottomBorderView];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [self removeConstraints:self.constraints];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(10);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.likeButton.mas_trailing).offset(20);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    [self.replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.commentButton.mas_trailing).offset(20);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    [self.bottomBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(20);
        make.trailing.equalTo(self.mas_trailing).offset(-20);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@1);
    }];
    
    [super updateConstraints];
}

@end
