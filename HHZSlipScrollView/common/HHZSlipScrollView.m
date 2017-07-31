//
//  HHZSlipScrollView.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/31.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipScrollView.h"
#import "HHZSlipBottomScrollView.h"
#import "HHZSlipTopItemCell.h"
#import "HHZSlipScrollManager.h"
#import <HHZCategory/UIView+HHZCategory.h>

@interface HHZSlipScrollView()<UITableViewDelegate,UITableViewDataSource>
/**
 *  顶部可滚动区域
 */
@property (nonatomic, strong) HHZSlipTopScrollView * topScrollView;
/**
 *  底部滚动视图
 */
@property (nonatomic, strong) HHZSlipBottomScrollView * bottomScrollView;
/**
 *  滚动高亮显示的View
 */
@property (nonatomic, strong) UIView * highlightView;
/**
 *  当前顶部视图选中的Cell
 */
@property (nonatomic, strong) HHZSlipTopItemCell * currentTopCell;
/**
 *  当前选择的索引
 */
@property (nonatomic, assign) NSInteger selectedIndex;
/**
 *  顶部Scroll到Item填充样式
 */
@property (nonatomic, assign) HHZSlipTopScrollViewItemFillType fillType;
/**
 *  顶部Scroll到Item大小的样式
 */
@property (nonatomic, assign) HHZSlipTopScrollViewItemAreaType areaType;
/**
 *  顶部Scroll的高度
 */
@property (nonatomic, assign) CGFloat topScrollViewHeight;
/**
 *  第一次加载，无动画
 */
@property (nonatomic, assign) BOOL isFirstLoadView;


#pragma mark 判断滑动到左边还是右边
/**
 *  手放上去之后的x值
 */
@property (nonatomic, assign) CGFloat beginContentOffsetX;

/**
 *  方向值判断 0-none 1-left 2-right
 */
@property (nonatomic, assign) NSInteger isRightLeftOrNone;
@end

@implementation HHZSlipScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fillType = HHZSlipTopScrollViewItemFillTypeLine;
        _areaType = HHZSlipTopScrollViewItemAreaTypeByScreenWidth;
        _isRightLeftOrNone = 0;
        _topScrollViewHeight = 44.0f;
        _selectedIndex = 0;
        _isFirstLoadView = YES;
    }
    return self;
}

-(void)modifySlipTopScrollViewItemAreaType:(HHZSlipTopScrollViewItemAreaType)areaType
{
    _areaType = areaType;
}

-(void)modifySlipTopScrollViewItemFillType:(HHZSlipTopScrollViewItemFillType)fillType
{
    _fillType = fillType;
}

-(void)modifySlipTopScrollViewHeight:(CGFloat)height
{
    _topScrollViewHeight = height;
}

-(void)modifyScrollBounces:(BOOL)isBounces
{
    _topScrollView.bounces = isBounces;
}

-(void)configFirstShowItemIndex:(NSInteger)showIndex
{
    _selectedIndex = showIndex;
}

#pragma mark 创建视图
-(void)createHHZSlipScrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(hhz_SlipScrollViewTopTitleArray:)])
    {
        [self createSlipTopScrollView];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(hhz_SlipScrollViewBottomViewArray:)])
    {
        [self createBottomScrollView];
    }
}

-(void)createSlipTopScrollView
{
    self.topScrollView = [[HHZSlipTopScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, _topScrollViewHeight) style:UITableViewStylePlain];
    self.topScrollView.bounces = NO;
    self.topScrollView.areaType = _areaType;
    self.topScrollView.titleArray = [NSMutableArray arrayWithArray:[self.delegate hhz_SlipScrollViewTopTitleArray:self.topScrollView]];
    //倒置UITableView
    self.topScrollView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.topScrollView.frame = CGRectMake(0, 0, self.width,_topScrollViewHeight);
    
    self.topScrollView.delegate = self;
    self.topScrollView.dataSource = self;
    
    //添加额外效果的滚动视图
    _highlightView = [[UIView alloc] init];
    _highlightView.backgroundColor = [HHZSlipScrollManager shareManager].bottomScrollViewColor;
    _highlightView.alpha = 0.5f;
    [self.topScrollView addSubview:_highlightView];
    
    [self addSubview:self.topScrollView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //如果传入的firstShowItemIndex大于数组个数，默认展示第一个
        if (_selectedIndex >= self.topScrollView.titleArray.count) _selectedIndex = 0;
        
        _currentTopCell = [self.topScrollView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        [self topItemTapScroll:_currentTopCell indexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        _isFirstLoadView = NO;
    });
}

-(void)createBottomScrollView
{
    if (self.topScrollView)
    {
        self.bottomScrollView = [[HHZSlipBottomScrollView alloc] initWithFrame:CGRectMake(self.topScrollView.x, self.topScrollView.yPlushHeight, self.topScrollView.width, self.height - self.topScrollView.height) style:UITableViewStylePlain];
    }
    else
    {
        self.bottomScrollView = [[HHZSlipBottomScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
    }
    
    self.bottomScrollView.viewsArray = [NSMutableArray arrayWithArray:[_delegate hhz_SlipScrollViewBottomViewArray:self.bottomScrollView]];
    
    //倒置UITableView
    self.bottomScrollView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.bottomScrollView.frame = CGRectMake(self.topScrollView.x, self.topScrollView.yPlushHeight, self.topScrollView.width, self.height - self.topScrollView.height);
    
    self.bottomScrollView.delegate = self;
    self.bottomScrollView.dataSource = self;
    
    [self addSubview:self.bottomScrollView];
}

#pragma mark 自定义事件
#pragma mark ------处理点击后顶部cell的变化
-(void)handleCellSelectedStateAtIndexPath:(NSIndexPath *)indexPath
{
    HHZSlipTopItemCell * cell = [_topScrollView cellForRowAtIndexPath:indexPath];
    if (![_currentTopCell isEqual:cell])
    {
        [self topItemTapScroll:cell indexPath:indexPath];
    }
}

-(void)topItemTapScroll:(HHZSlipTopItemCell *)cell indexPath:(NSIndexPath *)indexPath
{
    CGRect rect = CGRectZero;
    //赋值基本参数
    _currentTopCell.isSelected = NO;
    _currentTopCell = cell;
    _selectedIndex = indexPath.row;
    
    if (_fillType == HHZSlipTopScrollViewItemFillTypeNone)
    {
        [cell titleShowAnimate];
    }
    else
    {
        //文字本来的宽度,没有两边space的宽度
        CGFloat labelWidth = self.topScrollView.maxHeight - [HHZSlipScrollManager shareManager].cellItemSpace * 2;
        CGFloat fillWidth = [self.topScrollView.heightArray[indexPath.row] floatValue];
        switch (_fillType) {
            case HHZSlipTopScrollViewItemFillTypeLine:
            {
                rect = CGRectMake(0, cell.y + (cell.height - fillWidth)/2, 2, fillWidth);
            }
                break;
            case HHZSlipTopScrollViewItemFillTypeFill:
            {
                rect = CGRectMake((cell.width - cell.titleLabel.height - 3*2)/2, cell.y + (cell.height - labelWidth)/2 - 5,cell.titleLabel.height + 3*2, labelWidth + 5*2);
            }
                break;
            case HHZSlipTopScrollViewItemFillTypeTotalFill:
            {
                rect = CGRectMake(0, cell.y, cell.width, cell.height);
            }
                break;
            default:
                break;
        }
        
        _currentTopCell.isSelected = YES;
        if (_isFirstLoadView)
        {
            _highlightView.frame = rect;
            [self changeScrollLineLayer];
        }
        else
        {
            [UIView animateWithDuration:0.3f animations:^{
                _highlightView.frame = rect;
            } completion:^(BOOL finished) {
                [self changeScrollLineLayer];
            }];
        }
    }
}

-(void)changeScrollLineLayer
{
    if (_fillType == HHZSlipTopScrollViewItemFillTypeTotalFill)
    {
        _highlightView.layer.cornerRadius = 5.0f;
        _highlightView.layer.masksToBounds = YES;
    }
}


-(void)switchTopScrollToIndex:(NSInteger)scrollIndex
{
    if (scrollIndex < self.topScrollView.titleArray.count) {
        _currentTopCell.isSelected = NO;
        _selectedIndex = scrollIndex;
        _currentTopCell = [self.topScrollView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:scrollIndex inSection:0]];
        _currentTopCell.isSelected = YES;
        [_topScrollView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}

-(void)switchBottomScrollToIndex:(NSInteger)scrollIndex
{
    if (scrollIndex < self.bottomScrollView.viewsArray.count) {
        _selectedIndex = scrollIndex;
        [self.delegate hhz_SlipViewBottomViewScroll:self.bottomScrollView.viewsArray[scrollIndex] index:scrollIndex];
        [self.bottomScrollView setContentOffset:CGPointMake(self.bottomScrollView.contentOffset.x, scrollIndex * self.bottomScrollView.width) animated:YES];
    }
}


#pragma mark UITableView回调方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_topScrollView])
    {
        return self.topScrollView.titleArray.count;
    }
    else
    {
        return self.bottomScrollView.viewsArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    if ([tableView isEqual:self.topScrollView])
    {
        cell = [HHZSlipTopItemCell configCellWithTableView:tableView title:self.topScrollView.titleArray[indexPath.row] ];
        ((HHZSlipTopItemCell *)cell).isSelected = (_selectedIndex == indexPath.row);
    }
//    else if ([tableView isEqual:self.bottomScrollView])
//    {
//        static NSString * bottomScrollViewCellIdentifier = @"bottomScrollViewCellIdentifier";
//        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:bottomScrollViewCellIdentifier];
//        if(!cell)
//        {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bottomScrollViewCellIdentifier];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//            cell.transform = CGAffineTransformMakeRotation(M_PI_2);
//        }
//        [cell.contentView addSubview:[self.bottomScrollView gainViewAtIndex:indexPath.row]];
//        return cell;
//    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_topScrollView])
    {
        [self handleCellSelectedStateAtIndexPath:indexPath];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.topScrollView])
    {
        return [self.topScrollView.heightArray[indexPath.row] floatValue];
    }
    else if ([tableView isEqual:self.bottomScrollView])
    {
        return self.width;
    }
    return 0.01;
}

#pragma mark scrollDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.bottomScrollView])
    {
        self.beginContentOffsetX = scrollView.contentOffset.y;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.bottomScrollView])
    {
        if (self.beginContentOffsetX - scrollView.contentOffset.y > scrollView.frame.size.width/2)
        {
            self.isRightLeftOrNone = 1;
        }
        else if(self.beginContentOffsetX - scrollView.contentOffset.y < -scrollView.frame.size.width/2)
        {
            self.isRightLeftOrNone = 2;
        }
        else
        {
            self.isRightLeftOrNone = 0;
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.bottomScrollView])
    {
        switch (self.isRightLeftOrNone)
        {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                if (_selectedIndex > 0) {
                    NSInteger index = _selectedIndex - 1;
                    [self switchBottomScrollToIndex:index];
                    [self switchTopScrollToIndex:index];
                }
            }
                break;
            case 2:
            {
                if (_selectedIndex < self.bottomScrollView.viewsArray.count) {
                    NSInteger index = _selectedIndex + 1;
                    [self switchBottomScrollToIndex:index];
                    [self switchTopScrollToIndex:index];
                }
            }
                break;
            default:
                break;
        }
    }
    
}

@end
