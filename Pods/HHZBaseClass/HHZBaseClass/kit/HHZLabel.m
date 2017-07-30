//
//  HHZLabel.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZLabel.h"
#import "HHZCalculateTool.h"

@implementation HHZLabel
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _limitWidth = [UIScreen mainScreen].bounds.size.width;
        _limitNumbers = 0;
        _isChangeFrame = YES;
    }
    return self;
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    _labelSize = [HHZCalculateTool getLabelActualSizeWithString:text andFont:self.font.pointSize andLines:_limitNumbers andlabelWidth:_limitWidth andFontName:self.font.fontName];
    if (_isChangeFrame)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _labelSize.width, _labelSize.height);
    }
}
@end
