//
//  NSString+NEUExtension.h
//  Neuron
//
//  Created by Lix on 16/9/10.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LixExtension)

/**
 *  计算字符串长度
 *
 *  @param font    字体大小
 *
 *  @return 字符串长度
 */
- (CGSize)lix_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
