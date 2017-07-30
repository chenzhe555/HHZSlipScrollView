//
//  UIImage+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (HHZUtils_ImageEffects)

NS_ASSUME_NONNULL_BEGIN

#pragma mark ImageEffects
// 模糊效果(渲染很耗时间,建议在子线程中渲染)
- (UIImage *)blurImage;
- (UIImage *)blurImageWithMask:(UIImage *)maskImage;
- (UIImage *)blurImageWithRadius:(CGFloat)radius;
- (UIImage *)blurImageAtFrame:(CGRect)frame;

// 灰度效果
- (UIImage *)grayScale;

// 固定宽度与固定高度
- (UIImage *)scaleWithFixedWidth:(CGFloat)width;
- (UIImage *)scaleWithFixedHeight:(CGFloat)height;

// 平均的颜色
- (UIColor *)averageColor;

// 裁剪图片的一部分
- (UIImage *)croppedImageAtFrame:(CGRect)frame;

// 将自身填充到指定的size
- (UIImage *)fillClipSize:(CGSize)size;

@end


#pragma mark 获取bundle里面图片信息
@interface UIImage (HHZUtils_Bundle)
/**
 *  获取当前App的Icon图片Image对象
 *
 *  @return
 */
+(UIImage *)getAppIcon_hhz;
@end


#pragma mark 对图片进行压缩大小，拉伸，离屏渲染等等操作
@interface UIImage (HHZUtils_Transform)

/**
 *  压缩当前图片Image成指定大小Image
 *
 *  @param size 指定尺寸
 */
-(UIImage *)compressToSize_hhz:(CGSize)size;

/**
 *  根据传入的图片最大宽高参数，计算出图片容器的Size
 *
 *  @param image 传入的图片
 *
 *  @return
 */
-(CGSize)getContainerSizeWithLimitWidth_hhz:(CGFloat)limitWidth andLimitHeight:(CGFloat)limitHeight;

/**
 *  拉伸Image矩形范围内视图(仅拉伸区域内，类型QQ聊天框)
 *
 *  @param edgeInset 指定矩形区域
 *
 *  @return
 */
-(UIImage *)resizeImageWithEdge_hhz:(UIEdgeInsets)edgeInset;

/**
 *  传入颜色对象获取纯色Image对象
 *
 *  @param color 颜色值
 *
 *  @return
 */
+(UIImage *)transformToPureImageWithColor_hhz:(UIColor *)color;


-(UIImage*)imageRotatedByDegrees_hhz:(CGFloat)degrees;

/**
 *  设置Image的圆角，避免离屏渲染
 *
 *  @param radius 圆角
 *  @param size
 *
 *  @return
 */
-(UIImage *)imageWithCornerRadius_hhz:(CGFloat)radius Size:(CGSize)size;

@end

@interface UIImage (HHZ_Watermark)
/**
 *  添加水印文字到图片上(默认字体大小40,颜色黑色)
 *
 *  @param text  水印文字
 *  @param rect  坐标地址
 *
 *  @return 
 */
-(nullable UIImage *)addWatermarkText_hhz:(NSString *)text Rect:(CGRect)rect;

/**
 *  添加水印文字到图片上
 *
 *  @param text      水印文字
 *  @param rect      坐标地址
 *  @param attribute 字体属性
 *
 *  @return 
 */
-(nullable UIImage *)addWatermarkText_hhz:(NSString *)text Rect:(CGRect)rect Attribute:(nullable NSDictionary *)attribute;

/**
 *  添加水印图片
 *
 *  @param image  水印图片
 *  @param rect   水印图片Rect
 *  @param bgRect 底部画布的Rect
 *
 *  @return
 */
-(nullable UIImage *)addWatermarkImage_hhz:(UIImage *)image Rect:(CGRect)rect BGRect:(CGRect)bgRect;

/**
 *  合并两个图片
 *
 *  @param imageOne 图片1
 *  @param imageTwo 图片2
 *  @param oneRect  图片1Rect
 *  @param twoRect  图片2Rect
 *  @param bgRect   底部画布的Rect
 *
 *  @return 
 */
+(nullable UIImage *)mergeImage_hhz:(UIImage *)imageOne WithBImage:(UIImage *)imageTwo OneRect:(CGRect)oneRect TwoRect:(CGRect)twoRect BGRect:(CGRect)bgRect;
@end

NS_ASSUME_NONNULL_END
