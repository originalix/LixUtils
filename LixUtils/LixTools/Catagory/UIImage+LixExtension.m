//
//  UIImage+NEUExtension.m
//  Neuron
//
//  Created by Lix on 16/9/10.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "UIImage+LixExtension.h"

@implementation UIImage (LixExtension)

+ (UIImage *)lix_imageWithName:(NSString *)imageName
{
    UIImage *newImage = nil;
    if (iOS7) {
        newImage = [UIImage imageNamed:[imageName stringByAppendingString:@"_os7"]];
    }
    if (newImage == nil) {
        newImage = [UIImage imageNamed:imageName];
    }
    return newImage;
    
}

+ (UIImage *)lix_resizableImageWithName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    // 获取原有图片的宽高的一半
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}

-(UIImage*)lix_scaleImageWithSize:(CGSize)size
{
    
    UIGraphicsBeginImageContextWithOptions(size,NO,0);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

@end
