//
//  HHZSlipTopScrollView.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipTopScrollView.h"
#import <HHZConfigs/HHZConfig.h>
#import <HHZUtils/HHZCalculateTool.h>
#import <HHZCategory/UIView+HHZCategory.h>
#import "HHZSlipScrollManager.h"

@implementation HHZSlipTopScrollView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        _areaType = HHZSlipTopScrollViewItemAreaTypeRegulation;
        _heightArray = [NSMutableArray array];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

-(void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    _maxHeight = [self calculateMaxWidth];
}

-(CGFloat)calculateMaxWidth
{
    CGFloat maxWidth = 0.0f;
    CGSize labelSize = CGSizeZero;
    
    for (int i = 0; i < _titleArray.count; i++)
    {
        labelSize = [HHZCalculateTool getLabelActualSizeWithString:[_titleArray objectAtIndex:i] andFont:[HHZSlipScrollManager shareManager].titleFont.pointSize andLines:0 andlabelWidth:SCREENW];
        maxWidth = MAX(labelSize.width, maxWidth);
        [_heightArray addObject:@(labelSize.width + [HHZSlipScrollManager shareManager].cellItemSpace * 2)];
    }
    
    switch (_areaType) {
        case HHZSlipTopScrollViewItemAreaTypeRegulation:
        {
            [_heightArray removeAllObjects];
            for (int i = 0; i < _titleArray.count; i++)
            {
                [_heightArray addObject:@(maxWidth + [HHZSlipScrollManager shareManager].cellItemSpace * 2)];
            }
        }
            break;
        case HHZSlipTopScrollViewItemAreaTypeByScreenWidth:
        {
            [_heightArray removeAllObjects];
            CGFloat width = SCREENW/_titleArray.count;
            for (int i = 0; i < _titleArray.count; i++)
            {
                [_heightArray addObject:@(width)];
            }
        }
            break;
        default:
            break;
    }
    
    return (maxWidth + [HHZSlipScrollManager shareManager].cellItemSpace * 2);
}


@end
