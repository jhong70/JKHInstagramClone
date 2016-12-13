//
//  JKHLoginViewController.m
//  Instagram
//
//  Created by Joon Hong on 9/21/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHLoginViewController.h"
#import "JKHLoginFormView.h"
#import "JKHLoginManager.h"
#import "JKHMainTabBarViewController.h"

@interface JKHLoginViewController () <JKHLoginFormViewDelegate, JKHLoginManagerDelegate, CAAnimationDelegate>

@property (nonatomic, strong) JKHLoginManager *loginManager;
@property (nonatomic, strong) JKHLoginFormView *loginFormView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic) BOOL shouldAnimateBackground;

@end

static const CGFloat layerAnimationDuration = 80;

@implementation JKHLoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.loginManager = [[JKHLoginManager alloc] initWithDelegate:self];
    
    [self setupLoginFormView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupBackground];
    
    [self updateViewConstraints];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self removeAndStopBackgroundAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Setup

- (void)setupLoginFormView {
    self.loginFormView = [[JKHLoginFormView alloc] init];
    self.loginFormView.delegate = self;
    
    [self.view addSubview:self.loginFormView];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self.loginFormView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY).with.offset(-40);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
    }];
    
}

- (void)setupBackground {
    // Initialize colors
    UIColor *redColor = UIColorFromRGB(0xD15B52);
    UIColor *blueColor = UIColorFromRGB(0x2D5E7C);
    UIColor *darkBlue = UIColorFromRGB(0x101A55);
    UIColor *greenColor = UIColorFromRGB(0x6CB460);
    NSArray *colors = @[(id)redColor.CGColor, (id)blueColor.CGColor, (id)darkBlue.CGColor, (id)greenColor.CGColor, (id)redColor.CGColor];

    if (!self.gradientLayer) {
        self.gradientLayer = [[CAGradientLayer alloc] init];
        self.gradientLayer.colors = colors;
    }
    
    [self.gradientLayer removeFromSuperlayer];
    
    self.gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width * colors.count * 4, self.view.frame.size.height);
    self.gradientLayer.bounds = self.gradientLayer.frame;
    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
    self.gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    self.shouldAnimateBackground = YES;

    [self.view.layer insertSublayer:self.gradientLayer atIndex:0];
    
    [self setupBackgroundAnimation];
}

- (void)setupBackgroundAnimation {
    [self.gradientLayer removeAnimationForKey:@"basic"];
    self.shouldAnimateBackground = YES;
   
    NSValue *from = [self.gradientLayer valueForKey:@"position.x"];
    NSValue *to = @(self.gradientLayer.position.x - (self.gradientLayer.frame.size.width) + self.view.frame.size.width);
    
    CABasicAnimation *animation = [self backgroundAnimationWithFromPosition:from toPosition:to];
    
    [self.gradientLayer addAnimation:animation forKey:@"basic"];

}

- (void)removeAndStopBackgroundAnimation {
    self.shouldAnimateBackground = NO;
    [self.gradientLayer removeAnimationForKey:@"basic"];
}

- (CABasicAnimation *)backgroundAnimationWithFromPosition:(NSValue *)from toPosition:(NSValue *)to {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = from;
    animation.toValue = to;
    animation.duration = layerAnimationDuration;
    animation.delegate = self;

    return animation;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self.gradientLayer removeAnimationForKey:@"basic"];
    
    if (self.shouldAnimateBackground) {
        NSValue *to = [anim valueForKey:@"toValue"];
        NSValue *from = [anim valueForKey:@"fromValue"];

        CABasicAnimation *animation = [self backgroundAnimationWithFromPosition:to toPosition:from];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.gradientLayer addAnimation:animation forKey:@"basic"];
        });
    }
}

#pragma mark - JKHLoginFormViewDelegate

- (void)loginFormSubmitted {
    [self.loginManager startLogin];
}

#pragma mark - JKHLoginManagerDelegate

- (void)loginManagerRequestsViewControllerPresentation:(UIViewController *)vc {
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)loginManagerDidFinishLogin:(BOOL)success user:(JKHUser *)user {
    JKHMainTabBarViewController *vc = [[JKHMainTabBarViewController alloc] init];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:vc animated:YES completion:nil];
    });
}

@end
