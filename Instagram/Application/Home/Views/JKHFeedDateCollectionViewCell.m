//
//  JKHFeedDateCollectionViewCell.m
//  Instagram
//
//  Created by Joon Hong on 10/30/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedDateCollectionViewCell.h"

@interface JKHFeedDateCollectionViewCell ()

@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation JKHFeedDateCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.dateLabel = [UILabel new];
        
        [self.dateLabel setFont:[UIFont systemFontOfSize:11 weight:UIFontWeightThin]];
        [self.dateLabel setTextColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1]];
        
        [self addSubview:self.dateLabel];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(10);
        make.top.equalTo(self.mas_top);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [super updateConstraints];
}

#pragma mark - Public API

- (void)setMedia:(JKHMedia *)media {
    
    if (media.createdTime) {
        [self.dateLabel setText:[media.createdTime.timeAgoSinceNow uppercaseString]];
    }
}


@end
