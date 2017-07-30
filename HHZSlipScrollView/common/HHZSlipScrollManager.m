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
    _bottomScrollViewColor = [UIColor greenColor];
    _titleNormalColor = [UIColor blackColor];
    _titleSelectedColor = [UIColor redColor];
    _titleFont = [UIFont systemFontOfSize:13.0f];
    _cellItemSpace = 10.0f;
}

@end
