//
//  UIBarButtonItem+NEUExtension.h
//  Neuron
//
//  Created by Lix on 16/9/28.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kLeftItemTag  1011
#define kRightItemTag 1012

typedef NS_ENUM(NSInteger, LIXBarButtonItemSite){
    LIXLeftItem = 1,
    LIXRightItem = 2
};

@interface UIBarButtonItem (LixExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action site:(LIXBarButtonItemSite)site;

@end
