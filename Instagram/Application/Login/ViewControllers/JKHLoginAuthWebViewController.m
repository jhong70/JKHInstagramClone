//
//  JKHLoginAuthWebViewController.m
//  Instagram
//
//  Created by Joon Hong on 10/25/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHLoginAuthWebViewController.h"

@interface JKHLoginAuthWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic) BOOL shouldDismiss;

@end

@implementation JKHLoginAuthWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[InstagramAPI authorizationURL]];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    self.webView.delegate = self;
    
    [self setupTitleLabel];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:request];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.height.equalTo(@100);
    }];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [super updateViewConstraints];
}

#pragma mark - Setup

- (void)setupTitleLabel {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];

    
    title.text = @"Instagram OAuth";
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:17.0 weight:UIFontWeightBold];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setBackgroundColor: [UIColor whiteColor]];
    [title sizeToFit];
    
    self.titleLabel = title;
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([[InstagramAPI sharedInstance] receivedAccessTokenWithURL:request.URL]) {
        NSString *token = [[InstagramAPI sharedInstance] accessToken];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:^{
                if (self.delegate && [self.delegate conformsToProtocol:@protocol(JKHLoginAuthWebDelegate)]) {
                    [self.delegate loginAuthWebControllerDidSucceedWithToken:token];
                }
            }];
        });
        
        return NO;
    }
    
    return YES;
}

@end
