//
//  NSDictionary+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark ----------->NSDictionary
@interface NSDictionary (HHZUtils_NSDictionary)

/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSDictionary打印的description方法，打印的时候能很清楚看到中文字符
 *
 *  @param locale
 *
 *  @return
 */
-(NSString *)descriptionWithLocale:(id)locale;

/**
 *  不区分大小，输出排序后的Key
 *
 *  @return 排序后的Key
 */
-(nullable NSArray *)allSortedKeys_hhz;

/**
 *  获取字典中的字符串，传入默认值
 *
 *  @param key       键
 *  @param defString 如果没有返回默认字符串
 *
 *  @return 键对应的值
 */
-(nullable NSString *)getStringValueForKey_hhz:(nullable NSString *)key DefaultString:(nullable NSString *)defString;
@end






#pragma mark ----------->NSMutableDictionary

@interface NSMutableDictionary (HHZUtils_NSMutableDictionary)
/**
 *  如果Object为空，默认往字典中塞入Null对象
 *
 *  @param anObject 存储的数据
 *  @param aKey     key值
 */
-(void)setObject_hhz:(nullable id)aObject Key:(nullable id<NSCopying>)aKey;
@end

NS_ASSUME_NONNULL_END
