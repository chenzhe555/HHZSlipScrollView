//
//  HHZWebViewController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/7.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZWebViewController.h"

@interface HHZWebViewController ()

@end

@implementation HHZWebViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWebView];
    [self loadWebRequest];
    [self createActivity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化

-(void)loadWebRequest
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}

#pragma mark 视图创建

-(void)createWebView
{
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

-(void)createActivity
{
    self.activityView = [[UIActivityIndicatorView alloc] init];
    self.activityView.center = _webView.center;
    self.activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.webView addSubview:self.activityView];
}

#pragma mark 自定义辅助方法
-(void)generateCookieName:(NSString *)cookieName Value:(NSString *)cookieValue Domain:(NSString *)cookieDomain Path:(NSString *)cookiePath Expires:(NSTimeInterval)expires
{
    NSMutableDictionary * cookiePropertie = [NSMutableDictionary dictionary];
    [cookiePropertie setObject:cookieName forKey:NSHTTPCookieName];
    [cookiePropertie setObject:cookieValue forKey:NSHTTPCookieValue];
    [cookiePropertie setObject:cookieDomain forKey:NSHTTPCookieDomain];
    [cookiePropertie setObject:cookiePath forKey:NSHTTPCookiePath];
    [cookiePropertie setObject:[[NSDate date] dateByAddingTimeInterval:expires] forKey:NSHTTPCookieExpires];
    NSHTTPCookie * cookie = [NSHTTPCookie cookieWithProperties:cookiePropertie];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}

#pragma mark 触发事件

#pragma mark 回调事件

#pragma mark 回调事件 --> UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self.activityView startAnimating];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityView stopAnimating];
}
@end
