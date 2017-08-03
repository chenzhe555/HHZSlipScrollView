//
//  HHZSlipBottomItemCell.m
//  HHZSlipScrollView
//
//  Created by 陈哲是个好孩子 on 2017/8/2.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZSlipBottomItemCell.h"

@implementation HHZSlipBottomItemCell

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
    _pasteView.frame = self.bounds;
}

+(instancetype)configCellWithTableView:(UITableView *)tableView contentView:(nonnull UIView *)contentView
{
    static NSString * HHZSlipBottomItemCellIndentifier = @"HHZSlipBottomItemCellIndentifier";
    HHZSlipBottomItemCell * cell = [tableView dequeueReusableCellWithIdentifier:HHZSlipBottomItemCellIndentifier];
    if (!cell)
    {
        cell = [[HHZSlipBottomItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HHZSlipBottomItemCellIndentifier];
        cell.transform = CGAffineTransformMakeRotation(M_PI_2);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
       
    }
    [cell.pasteView removeFromSuperview];
    cell.pasteView = contentView;
    [cell addSubview:cell.pasteView];
    return cell;
}

@end
