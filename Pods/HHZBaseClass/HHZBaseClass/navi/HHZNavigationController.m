//
//  HHZNavigationController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZNavigationController.h"

@interface HHZNavigationController ()

@end

@implementation HHZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configNaviSchemeTextColor:(UIColor *)textColor textfontSize:(CGFloat)fontSize isBlod:(BOOL)isBold
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    if (textColor)
    {
        //设置文字颜色
        textAttrs[NSForegroundColorAttributeName] = textColor;
    }
    else
    {
        textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    }
    if (fontSize > 0.0f)
    {
        if (isBold)
        {
            //设置文字加粗和大小
            if (isBold) {
                textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:fontSize];
            }
            else {
                textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
            }
        }
    }
    
    [navBar setTitleTextAttributes:textAttrs];
}

-(void)configNaviSchemeBarTintColor:(UIColor *)tintColor
{
    [self.navigationBar setBarTintColor:tintColor];
    [self.navigationBar setTranslucent:NO];
}

@end
