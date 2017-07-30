//
//  UIView+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UIView+HHZCategory.h"
#import <objc/runtime.h>

@implementation UIView (setFrame)

- (CGPoint) origin {
    return self.frame.origin;
}

- (void) setOrigin:(CGPoint) point {
    self.frame = CGRectMake(point.x, point.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize) size {
    return self.frame.size;
}

- (void) setSize:(CGSize) size {
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (CGFloat) x {
    return self.frame.origin.x;
}

- (void) setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat) y {
    return self.frame.origin.y;
}
- (void) setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat) height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

-(CGFloat)xPlusWidth
{
    return self.x + self.width;
}

-(void)setXPlusWidth:(CGFloat)xPlusWidth
{
    self.frame = CGRectMake(xPlusWidth - self.width, self.y, self.width, self.height);
}

-(CGFloat)yPlushHeight
{
    return self.y + self.height;
}

-(void)setYPlushHeight:(CGFloat)yPlushHeight
{
    self.frame = CGRectMake(self.x, yPlushHeight - self.height, self.width, self.height);
}

@end

@implementation UIView (FixViewDebugging)

+ (void)load
{
    Method original = class_getInstanceMethod(self, @selector(viewForBaselineLayout));
    class_addMethod(self, @selector(viewForFirstBaselineLayout), method_getImplementation(original), method_getTypeEncoding(original));
    class_addMethod(self, @selector(viewForLastBaselineLayout), method_getImplementation(original), method_getTypeEncoding(original));
}

@end

@implementation UIView(Screenshot)

- (UIImage *)generateScreenShot {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds
               afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

@implementation UIView(rippleEffect)

-(void)showRippleEffect
{
    CATransition *transition = [CATransition animation];
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.duration = 0.5f;
    transition.type = @"rippleEffect";
    [self.layer addAnimation:transition forKey:nil];
}

@end
