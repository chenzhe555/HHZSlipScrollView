//
//  HHZWebViewController.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/7.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHZWebViewController : UIViewController<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView * webView;
/**
 *  打开的网页地址
 */
@property (nonatomic, strong) NSString * urlString;
/**
 *  创建WebView(默认自行创建,需要自己实现需重载)
 */
-(void)createWebView;

/**
 *  加载Request请求
 */
-(void)loadWebRequest;




#pragma mark Activity菊花
/**
 *  菊花
 */
@property (nonatomic, strong) UIActivityIndicatorView * activityView;
/**
 *  创建Activity菊花View
 */
-(void)createActivity;


#pragma mark Cookie相关的
/**
 *  设置Cookie
 */
-(void)generateCookieName:(NSString *)cookieName Value:(NSString *)cookieValue Domain:(NSString *)cookieDomain Path:(NSString *)cookiePath Expires:(NSTimeInterval)expires;
@end
