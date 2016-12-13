//
//  JKHFeedViewController.m
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHFeedViewController.h"
#import <IGListKit/IGListKit.h>
#import "JKHFeedImageSectionController.h"

@interface JKHFeedViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapterUpdater *updater;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSMutableArray *media;

@end

@implementation JKHFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.media = [NSMutableArray new];
    
    self.collectionView = [[IGListCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    self.updater = [[IGListAdapterUpdater alloc] init];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:self.updater viewController:self workingRangeSize:0];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    self.navigationController.hidesBarsOnSwipe = YES;
    
    [self setupNavigationItem];
    [self fetchSelfRecentMedia];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController addOpaqueStatusBarBackgroundWithColor:[UIColor whiteColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.hidesBarsOnSwipe = NO;
    [self.navigationController removeOpaqueStatusBarBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupNavigationItem {
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    UIImageView *igImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];

    [igImageView setFrame:titleView.bounds];
    [igImageView setContentMode: UIViewContentModeScaleAspectFit];

    [titleView addSubview:igImageView];
    
    [self.navigationItem setTitleView:titleView];
    
    // Set Navigation bar buttons
    UIButton *directButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20.0f, 20.0f)];
    UIImage *directImage = [UIImage imageNamed:@"direct-icon"];
    [directButton setBackgroundImage:directImage forState:UIControlStateNormal];
    UIBarButtonItem* directBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:directButton];
    
    
    directBarButtonItem.width = .0f;
    [self.navigationItem setRightBarButtonItem:directBarButtonItem];
}

#pragma mark - Networking

- (void)fetchSelfRecentMedia {
    [[InstagramAPI sharedInstance] getSelfRecentMediaWithCompletion:^(BOOL success, NSArray<JKHMedia *> *media) {
        if (media) {
            self.media = [media mutableCopy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.adapter performUpdatesAnimated:YES completion:nil];
            });
        }
    }];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.media;
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [[JKHFeedImageSectionController alloc] init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


@end
