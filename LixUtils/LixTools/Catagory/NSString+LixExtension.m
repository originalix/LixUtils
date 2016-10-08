//
//  NSString+NEUExtension.m
//  Neuron
//
//  Created by Lix on 16/9/10.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "NSString+LixExtension.h"

@implementation NSString (LixExtension)

- (CGSize)lix_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

@end
