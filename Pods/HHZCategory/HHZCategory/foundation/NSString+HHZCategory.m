//
//  NSString+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSString+HHZCategory.h"
#import <objc/runtime.h>

@implementation NSString (HHZUtils_AttributString)

-(NSMutableAttributedString *)addCustomAttributeFont_hhz:(UIFont *)font andColor:(UIColor *)color andRange:(NSRange)range
{
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self];
    if (font)
    {
        [attStr addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color)
    {
        [attStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attStr;
}

-(NSMutableAttributedString *)addCustomAttributeFont_hhz:(UIFont *)font andColor:(UIColor *)color andText:(NSString *)searchText
{
    if ([self rangeOfString:searchText].location == NSNotFound)
    {
        return [[NSMutableAttributedString alloc]initWithString:self];
    }
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self];
    NSMutableArray * mutaArr = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange resultRange;
    while ((resultRange = [self rangeOfString:searchText options:0 range:searchRange]).location != NSNotFound)
    {
        [mutaArr addObject:[NSValue valueWithRange:resultRange]];
        searchRange = NSMakeRange(NSMaxRange(resultRange), self.length - NSMaxRange(resultRange));
    }
    for (int i = 0; i < mutaArr.count; i++)
    {
        if (font)
        {
            [attStr addAttribute:NSFontAttributeName value:font range:[[mutaArr objectAtIndex:i] rangeValue]];
        }
        if (color)
        {
            [attStr addAttribute:NSForegroundColorAttributeName value:color range:[[mutaArr objectAtIndex:i] rangeValue]];
        }
    }
    return attStr;
}

-(NSMutableAttributedString *)addLineAttributerWithTextWithColor_hhz:(UIColor *)color
{
    return [self addLineAttributerWithRange_hhz:NSMakeRange(0, self.length) andColor:color];
}

-(NSMutableAttributedString *)addLineAttributerWithRange_hhz:(NSRange)range andColor:(UIColor *)color
{
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:self];
    //加入下划线
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    //如果传入颜色，则加上下划线颜色
    if (color != nil)
    {
        [str addAttribute:NSUnderlineColorAttributeName value:color range:range];
    }
    return str;
}

@end

@implementation NSString (HHZUtils_ClassBuild)

-(Class)getObjClass_hhz
{
    const char * className = [self cStringUsingEncoding:NSASCIIStringEncoding];
    Class objClass = objc_getClass(className);
    //如果木有,则注册创建一个
    if (objClass == nil)
    {
        Class superClass = [NSObject class];
        objClass = objc_allocateClassPair(superClass, className, 0);
        objc_registerClassPair(objClass);
    }
    return objClass;
}

@end

@implementation NSString (HHZUtils_Emoji)

-(BOOL)isIncludeEmoji:(EmojiType)type
{
    switch (type) {
        case EmojiTypeNormal:
        {
            return [self isIncludeNormalEmoji];
        }
            break;
            
        default:
            break;
    }
}

-(BOOL)isIncludeNormalEmoji
{
    BOOL __block result = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if ([substring isNormalEmoji]) {
            *stop = YES;
            result = YES;
        }
    }];
    return result;
}

-(BOOL)isNormalEmoji
{
    const unichar hs = [self characterAtIndex:0];
    // surrogate pair
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (self.length > 1) {
            const unichar ls = [self characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f77f) {
                return YES;
            }
            if (hs == 0xd83e) {
                return YES;
            }
        }
    } else if (self.length > 1) {
        const unichar ls = [self characterAtIndex:1];
        if (ls == 0x20e3 || ls == 0xfe0f) {
            return YES;
        }
        
    } else {
        // non surrogate
        if (0x2100 <= hs && hs <= 0x27ff) {
            return YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            return YES;
        } else if (0x2934 <= hs && hs <= 0x2935) {
            return YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            return YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            return YES;
        } else {
            return NO;
        }
    }
    
    return NO;
}

-(instancetype)removedEmojiString:(EmojiType)type
{
    switch (type) {
        case EmojiTypeNormal:
        {
            return [self removedNormalEmojiString];
        }
            break;
            
        default:
            break;
    }
}

-(instancetype)removedNormalEmojiString
{
    NSMutableString * __block buffer = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [buffer appendString:([substring isNormalEmoji])? @"": substring];
    }];
    return buffer;
}

@end
