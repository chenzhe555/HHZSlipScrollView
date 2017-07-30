//
//  HHZWeakProxy.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 2017/1/13.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZWeakProxy : NSProxy
/**
 *  防止循环引用，创建一个弱引用代理
 *
 *  @param target 代理Agent
 *
 *  @return
 */
+(instancetype)proxyWithTarget_hhz:(id)target;
@end

NS_ASSUME_NONNULL_END
