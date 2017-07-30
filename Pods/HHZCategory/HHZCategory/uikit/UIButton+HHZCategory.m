//
//  UIButton+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UIButton+HHZCategory.h"

@implementation UIButton (HHZUtils_SetAttribution)
-(void)setNormalTitle_hhz:(NSString *)normalTitle andSelectedTitle:(NSString *)selectedTitle
{
    if (normalTitle != nil)
    {
        [self setTitle:normalTitle forState:UIControlStateNormal];
    }
    if (selectedTitle != nil)
    {
        [self setTitle:selectedTitle forState:UIControlStateSelected];
    }
}

-(void)setNormalImage_hhz:(UIImage *)normalImage andHighlightImage:(UIImage *)highImage andSelectedImage:(UIImage *)selectedImage
{
    if (normalImage != nil)
    {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    if (highImage != nil)
    {
        [self setImage:highImage forState:UIControlStateHighlighted];
    }
    if (selectedImage != nil)
    {
        [self setImage:selectedImage forState:UIControlStateSelected];
    }
    
}

-(void)setNormalBackgroundImage_hhz:(UIImage *)normalImage andHighlightBackgroundImage:(UIImage *)highImage andSelectedBackgroundImage:(UIImage *)selectedImage
{
    if (normalImage != nil)
    {
        [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    }
    if (highImage != nil)
    {
        [self setBackgroundImage:highImage forState:UIControlStateHighlighted];
    }
    if (selectedImage != nil)
    {
        [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
    }
}

-(void)changeCornerRadius_hhz:(CGFloat)radius
{
    if (radius == 0)
    {
        self.layer.cornerRadius = 6.0f;
    }
    else
    {
        self.layer.cornerRadius = radius;
    }
    
    self.layer.masksToBounds = YES;
}
@end
