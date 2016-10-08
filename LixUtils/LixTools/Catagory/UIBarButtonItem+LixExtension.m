//
//  UIBarButtonItem+NEUExtension.m
//  Neuron
//
//  Created by Lix on 16/9/28.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "UIBarButtonItem+LixExtension.h"

@implementation UIBarButtonItem (LixExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action site:(LIXBarButtonItemSite)site {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (site == LIXLeftItem) {
        button.tag = kLeftItemTag;
    } else if (site == LIXRightItem){
        button.tag = kRightItemTag;
    }
    return [[self alloc] initWithCustomView:button];
}

@end
