//
//  JKHFeedImageCollectionViewCell.m
//  Instagram
//
//  Created by Joon Hong on 10/29/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedImageCollectionViewCell.h"

@interface JKHFeedImageCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation JKHFeedImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [UIImageView new];
        
        [self addSubview:self.imageView];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.mas_top);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [super updateConstraints];
}

#pragma mark - Public API

- (void)setMedia:(JKHMedia *)media {
    NSURL *imageURL = [NSURL URLWithString:media.standardResImageURL];
    
    if (imageURL) {
        [self.imageView sd_setImageWithURL:imageURL];
    }

}

@end
