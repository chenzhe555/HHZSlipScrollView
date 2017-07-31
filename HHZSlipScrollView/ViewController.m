//
//  ViewController.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "ViewController.h"
#import "HHZSlipScrollView.h"

@interface ViewController ()<HHZSlipScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HHZSlipScrollView * slipView = [[HHZSlipScrollView alloc] init];
    slipView.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
    slipView.delegate = self;
    [slipView configFirstShowItemIndex:2];
    [slipView modifySlipTopScrollViewItemFillType:HHZSlipTopScrollViewItemFillTypeLine];
    [slipView createHHZSlipScrollView];
    
    [self.view addSubview:slipView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)hhz_SlipScrollViewTopTitleArray:(UIView *)topScrollView
{
    return [NSMutableArray arrayWithObjects:@"未读",@"已读",@"测试1", nil];
}



@end
