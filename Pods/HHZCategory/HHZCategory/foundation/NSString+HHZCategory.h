//
//  NSString+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark 对部分字体进行颜色、字体改变
@interface NSString (HHZUtils_AttributString)
/**
 *  对文本特定range进行颜色color和字体font的改变
 *
 *  @param font  改变的字体
 *  @param color 改变的颜色
 *  @param range 改变的range
 *
 *  @return
 */
-(NSMutableAttributedString *)addCustomAttributeFont_hhz:(UIFont *)font andColor:(UIColor *)color andRange:(NSRange)range;

/**
 *  对特定文字searchText所有地方进行颜色color和字体font的改变
 *
 *  @param font       改变的字体
 *  @param color      改变的颜色
 *  @param searchText 改变的range
 *
 *  @return
 */
-(NSMutableAttributedString *)addCustomAttributeFont_hhz:(UIFont *)font andColor:(UIColor *)color andText:(NSString *)searchText;

/**
 *  对特定字符串添加下划线
 *
 *  @param color 下划线颜色
 *
 *  @return
 */
-(NSMutableAttributedString *)addLineAttributerWithTextWithColor_hhz:(UIColor *)color;

/**
 *  对字符串的特定Range添加下划线
 *
 *  @param range 要改变的range
 *  @param color 下划线颜色
 *
 *  @return
 */
-(NSMutableAttributedString *)addLineAttributerWithRange_hhz:(NSRange)range andColor:(UIColor *)color;
@end

#pragma mark 通过类名获取类
@interface NSString (HHZUtils_ClassBuild)

-(Class)getObjClass_hhz;

@end


#pragma mark Emoji标签

typedef NS_ENUM(NSInteger,EmojiType) {
    EmojiTypeNormal = 1 << 0
};

@interface NSString (HHZUtils_Emoji)
/**
 *  是否包含Emoji表情(默认Emoji类型)
 *
 *  @return
 */
-(BOOL)isIncludeNormalEmoji;

/**
 *  移除默认Emoji表情类型
 *
 *  @return
 */
-(instancetype)removedNormalEmojiString;

/**
 *  是否包含Emoji表情
 *
 *  @param type Emoji的类型
 *
 *  @return 
 */
-(BOOL)isIncludeEmoji:(EmojiType)type;

/**
 *  移除Emoji标签
 *
 *  @param type Emoji类型
 *
 *  @return 
 */
-(instancetype)removedEmojiString:(EmojiType)type;
@end


NS_ASSUME_NONNULL_END

