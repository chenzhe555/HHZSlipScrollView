//
//  ViewController.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "ViewController.h"
#import "HHZSlipScrollView.h"
#import "HHZSlipBottomView.h"

@interface ViewController ()<HHZSlipScrollViewDelegate>
@property (nonatomic, strong) HHZSlipScrollView * slipView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _slipView = [[HHZSlipScrollView alloc] init];
    _slipView.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
    _slipView.delegate = self;
//    [_slipView configFirstShowItemIndex:2];
    [_slipView modifySlipTopScrollViewItemFillType:HHZSlipTopScrollViewItemFillTypeLine];
    [_slipView createHHZSlipScrollView];
    
    [self.view addSubview:_slipView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)hhz_SlipScrollViewTopTitleArray:(UIView *)topScrollView
{
    return [NSMutableArray arrayWithObjects:@"未读",@"已读",@"测试1", nil];
}

-(NSArray *)hhz_SlipScrollViewBottomViewArray:(UITableView *)bottomScrollView
{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < 3; ++i)
    {
        HHZSlipBottomView * vie = [[HHZSlipBottomView alloc] init];
        vie.frame = CGRectMake(0, 0, _slipView.bounds.size.width, _slipView.bounds.size.height);
        [arr addObject:vie];
        
        if (i == 0 )
        {
            [vie loadAllViews];
        }
    }
    return arr;
}

-(void)hhz_SlipViewBottomViewScroll:(UIView *)vc index:(NSInteger)index
{
    [((HHZSlipBottomView *)vc) loadAllViews];
}

@end
