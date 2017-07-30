//
//  HHZViewController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZViewController.h"
#import <HHZUtils/HHZMethodException.h>

@interface HHZViewController ()

@end

@implementation HHZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeData];
    [self createMainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeData
{
    @throw [HHZMethodException exceptionWithClass:NSStringFromClass([self class]) Method:NSStringFromSelector(_cmd)];
}

-(void)createMainView
{
    @throw [HHZMethodException exceptionWithClass:NSStringFromClass([self class]) Method:NSStringFromSelector(_cmd)];
}

-(void)back
{
    
}

@end
