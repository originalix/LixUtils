//
//  UIImage+NEUExtension.h
//  Neuron
//
//  Created by Lix on 16/9/10.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LixExtension)

/**
 *  针对ios7以上的系统适配新的图片资源
 *
 *  @param imageName 图片名称
 *
 *  @return 新的图片
 */
+ (UIImage *)lix_imageWithName:(NSString *)imageName;

/**
 *  返回一张可以随意拉伸不变形的图片
 *
 *  @param imageName 图片名字
 */
+ (UIImage *)lix_resizableImageWithName:(NSString *)imageName;

/**
 *  实现图片的缩小或者放大
 *
 *  @param size  大小范围
 *
 *  @return 新的图片
 */
- (UIImage*)lix_scaleImageWithSize:(CGSize)size;

@end
