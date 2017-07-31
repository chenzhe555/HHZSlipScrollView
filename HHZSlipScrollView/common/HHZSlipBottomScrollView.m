//
//  HHZSlipBottomScrollView.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/31.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipBottomScrollView.h"

@implementation HHZSlipBottomScrollView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.pagingEnabled = YES;
        self.bounces = NO;
    }
    return self;
}

-(void)configviewArray:(NSArray *)viewArray
{
    _viewsArray = [NSMutableArray arrayWithArray:viewArray];
}

-(NSInteger)gainViewArrayCount
{
    return _viewsArray.count;
}

-(UIView *)gainViewAtIndex:(NSInteger)index
{
    return _viewsArray[index];
}
@end
