//
//  JKHFeedImageSectionController.m
//  Instagram
//
//  Created by Joon Hong on 10/27/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedImageSectionController.h" 
#import "JKHFeedHeaderCollectionViewCell.h"
#import "JKHFeedImageCollectionViewCell.h"
#import "JKHFeedActionCollectionViewCell.h"
#import "JKHFeedLikesCollectionViewCell.h"
#import "JKHFeedDateCollectionViewCell.h"

@interface JKHFeedImageSectionController ()

@property (nonatomic, strong) JKHMedia *media;

@end

@implementation JKHFeedImageSectionController

#pragma mark - IGListSectionType

- (NSInteger)numberOfItems {
    return 5;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGSize itemSize = CGSizeZero;
    
    if (index == 0) {
        itemSize = CGSizeMake(screenSize.width, 50);
    } else if (index == 1) {
        itemSize = CGSizeMake(screenSize.width, screenSize.width / self.media.imageAspectRatio);
    } else if (index == 2) {
        itemSize = CGSizeMake(screenSize.width, 50);
    } else if (index == 3) {
        itemSize = CGSizeMake(screenSize.width, 40);
    } else if (index == 4) {
        itemSize = CGSizeMake(screenSize.width, 40);
    }
    
    return itemSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
    
    if (index == 0) {
        JKHFeedHeaderCollectionViewCell *headerCell = [self.collectionContext dequeueReusableCellOfClass:[JKHFeedHeaderCollectionViewCell class] forSectionController:self atIndex:index];
        [headerCell setMedia:self.media];
        cell = headerCell;
    } else if (index == 1) {
        JKHFeedImageCollectionViewCell *imageCell = [self.collectionContext dequeueReusableCellOfClass:[JKHFeedImageCollectionViewCell class] forSectionController:self atIndex:index];
        [imageCell setMedia:self.media];
        cell = imageCell;
    } else if (index == 2) {
        JKHFeedActionCollectionViewCell *actionCell = [self.collectionContext dequeueReusableCellOfClass:[JKHFeedActionCollectionViewCell class] forSectionController:self atIndex:index];
        cell = actionCell;
    } else if (index == 3) {
        JKHFeedLikesCollectionViewCell *likeCell = [self.collectionContext dequeueReusableCellOfClass:[JKHFeedLikesCollectionViewCell class] forSectionController:self atIndex:index];
        [likeCell setMedia:self.media];
        cell = likeCell;
    } else if (index == 4) {
        JKHFeedDateCollectionViewCell *dateCell = [self.collectionContext dequeueReusableCellOfClass:[JKHFeedDateCollectionViewCell class] forSectionController:self atIndex:index];
        [dateCell setMedia:self.media];
        cell = dateCell;
    }
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.media = (JKHMedia *)object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}

@end
