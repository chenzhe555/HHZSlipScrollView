//
//  UITableView+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UITableView+HHZCategory.h"

@implementation UITableView (HHZUtils_UITableView)
-(void)initializationData
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)bindDelegateWithTarget_hhz:(id)target
{
    [self initializationData];
    self.dataSource = target;
    self.delegate = target;
}

-(void)updateComponentBlock_hhz:(void (^)(UITableView * _Nonnull))block
{
    [self beginUpdates];
    block(self);
    [self endUpdates];
}

-(void)scrollToRow_hhz:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    [self scrollToRowAtIndexPath:[self getIndexPath:row inSection:section] atScrollPosition:scrollPosition animated:animated];
}

-(void)insertRow_hhz:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRowsAtIndexPaths:@[[self getIndexPath:row inSection:section]] withRowAnimation:animation];
}

-(void)reloadRow_hhz:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadRowsAtIndexPaths:@[[self getIndexPath:row inSection:section]] withRowAnimation:animation];
}

-(void)deleteRow_hhz:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteRowsAtIndexPaths:@[[self getIndexPath:row inSection:section]] withRowAnimation:animation];
}

-(void)insertSection_hhz:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[self getIndexSet:section] withRowAnimation:animation];
}

-(void)reloadSection_hhz:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadSections:[self getIndexSet:section] withRowAnimation:animation];
}

-(void)deleteSection_hhz:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteSections:[self getIndexSet:section] withRowAnimation:animation];
}

-(void)clearSelectedRowsAnimated_hhz:(BOOL)animated
{
    NSArray * arr = [self indexPathsForSelectedRows];
    [arr enumerateObjectsUsingBlock:^(NSIndexPath* path, NSUInteger idx, BOOL *stop) {
        [self deselectRowAtIndexPath:path animated:animated];
    }];
}


-(NSIndexPath *)getIndexPath:(NSUInteger)row inSection:(NSUInteger)section
{
    return [NSIndexPath indexPathForRow:row inSection:section];
}

-(NSIndexSet *)getIndexSet:(NSUInteger)section
{
    return [NSIndexSet indexSetWithIndex:section];
}
@end
