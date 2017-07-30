//
//  HHZTableViewCell.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZTableViewCell.h"

@implementation HHZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addBasicInfoConfig];
        [self initSomeThing];
    }
    return self;
}

-(void)initSomeThing
{
    self.spliteLine = [[UIView alloc] init];
    [self addSubview:self.spliteLine];
}

-(void)addDefaultSeparateLine:(UIColor *)color
{
    UIView * vie = [[UIView alloc] init];
    vie.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    vie.frame = CGRectMake(10, self.frame.size.height - 0.5, self.frame.size.width - 10, 0.5);
    [self addSubview:vie];
}

-(void)addBasicInfoConfig
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+(instancetype)configCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
