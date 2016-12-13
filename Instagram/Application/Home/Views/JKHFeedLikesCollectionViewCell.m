//
//  JKHFeedLikesCollectionViewCell.m
//  Instagram
//
//  Created by Joon Hong on 10/29/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedLikesCollectionViewCell.h"

@interface JKHFeedLikesCollectionViewCell ()

@property (nonatomic, strong) UILabel *likeLabel;

@end

@implementation JKHFeedLikesCollectionViewCell

NSString *const likeStringFormat = @"♥ %@ likes";

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.likeLabel = [[UILabel alloc] init];
        
        [self.likeLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightBold]];
        [self.likeLabel setTextColor:[UIColor blackColor]];
        
        [self setLikeText:@0];
        
        [self addSubview:self.likeLabel];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [self removeConstraints:[self constraints]];
    
    [self.likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(10);
        make.trailing.equalTo(self.mas_trailing);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [super updateConstraints];
}

#pragma mark - Helpers

- (void)setLikeText:(NSNumber *)likes {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // this line is important!
    
    NSString *formatted = [formatter stringFromNumber:likes];
    
    [self.likeLabel setText:[NSString stringWithFormat:likeStringFormat, formatted]];
}

#pragma mark - Public API

- (void)setMedia:(JKHMedia *)media {
    [self setLikeText:media.likeCount];
}

@end
