//
//  UINavigationBar+Addition.m
//  UINavigationBar+Addition
//
//  Created by Lix on 16/9/23.
//  Copyright (c) 2016 Neuron. All rights reserved.
//

#import "UINavigationBar+LixExtension.h"

@implementation UINavigationBar (LixExtension)

- (void)lix_hideBottomHairline {
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self];
    navBarHairlineImageView.hidden = YES;
}

- (void)lix_showBottomHairline {
    // Show 1px hairline of translucent nav bar
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self];
    navBarHairlineImageView.hidden = NO;
}


- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)lix_makeTransparent {
    [self setTranslucent:YES];
    [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.backgroundColor = [UIColor clearColor];
    self.shadowImage = [UIImage new];    // Hides the hairline
    [self lix_hideBottomHairline];
}

- (void)lix_makeDefault {
    [self setTranslucent:YES];
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.backgroundColor = nil;
    self.shadowImage = nil;    // Hides the hairline
    [self lix_showBottomHairline];
}


@end
