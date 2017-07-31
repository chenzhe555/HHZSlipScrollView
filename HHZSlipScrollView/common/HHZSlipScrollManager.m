//
//  HHZSlipScrollManager.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/31.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipScrollManager.h"

static HHZSlipScrollManager * manager = nil;
static dispatch_once_t onceToken;

@implementation HHZSlipScrollManager

+(HHZSlipScrollManager *)shareManager
{
    dispatch_once(&onceToken, ^{
        manager = [[HHZSlipScrollManager alloc] init];
        [manager loadConfigs];
    });
    return manager;
}

-(void)loadConfigs
{
    _bottomScrollViewColor = [UIColor colorWithRed:0/255.0 green:142/255.0 blue:242/255.0 alpha:1.0f];
    _titleNormalColor = [UIColor blackColor];
    _titleSelectedColor = [UIColor colorWithRed:0/255.0 green:142/255.0 blue:242/255.0 alpha:1.0f];
    _titleFont = [UIFont systemFontOfSize:16.0f];
    _cellItemSpace = 0.0f;
}

@end
