//
//  HHZSlipBottomView.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/8/2.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipBottomView.h"

@interface HHZSlipBottomView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation HHZSlipBottomView

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    NSInteger index = random()%6;
    _dataArray = [NSMutableArray array];
    switch (index) {
        case 0:
        {
            for (int i = 0; i < 100; ++i)
            {
                [_dataArray addObject:@"0000"];
            }
        }
            break;
        case 1:
        {
            for (int i = 0; i < 100; ++i)
            {
                [_dataArray addObject:@"1111"];
            }
        }
            break;
            
        default:
        {
            for (int i = 0; i < 100; ++i)
            {
                [_dataArray addObject:@"2222"];
            }
        }
            break;
    }
    
}

-(void)loadAllViews
{
    [self createTableView];
}

-(void)createTableView
{
    if (!self.tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self addSubview:self.tableView];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"几次的");
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sss"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection");
    return _dataArray.count;
}

@end
