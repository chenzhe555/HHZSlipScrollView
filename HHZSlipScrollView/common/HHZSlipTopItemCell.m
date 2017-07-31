//
//  HHZSlipTopItemCell.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipTopItemCell.h"
#import "HHZSlipScrollManager.h"

@implementation HHZSlipTopItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateCellSubviewsFrame];
}

-(void)updateCellSubviewsFrame
{
    self.titleLabel.frame = self.bounds;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [HHZSlipScrollManager shareManager].titleNormalColor;
        _titleLabel.font = [HHZSlipScrollManager shareManager].titleFont;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+(instancetype)configCellWithTableView:(UITableView *)tableView title:(NSString *)title
{
    static NSString * HHZSlipTopItemCellIndentifier = @"HHZSlipTopItemCellIndentifier";
    HHZSlipTopItemCell * cell = [tableView dequeueReusableCellWithIdentifier:HHZSlipTopItemCellIndentifier];
    if (!cell)
    {
        cell = [[HHZSlipTopItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HHZSlipTopItemCellIndentifier];
        cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    cell.titleLabel.text = title;
    return cell;
}

-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected)
    {
        self.titleLabel.textColor = [HHZSlipScrollManager shareManager].titleSelectedColor;
    }
    else
    {
        self.titleLabel.textColor = [HHZSlipScrollManager shareManager].titleNormalColor;
    }
}

-(void)titleShowAnimate
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.3];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = 1;
    scaleAnimation.duration = 0.2;
    [self.titleLabel.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    self.titleLabel.textColor = [HHZSlipScrollManager shareManager].titleSelectedColor;
}

@end
