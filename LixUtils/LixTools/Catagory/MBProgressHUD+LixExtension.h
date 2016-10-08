//
//  MBProgressHUD+NEUExtension.h
//  Neuron
//
//  Created by Lix on 16/9/26.
//  Copyright © 2016年 Lix. All rights reserved.
//

//#import <MBProgressHUD/MBProgressHUD.h>
#import "MBProgressHUD.h"

@interface MBProgressHUD (LixExtension)

/**
 *  返回一个成功的 HUD
 *
 *  @param success 要显示的文字
 */
+ (void)showSuccess:(NSString *)success;

/**
 *  返回一个失败的 HUD
 *
 *  @param error 要显示的文字
 */
+ (void)showError:(NSString *)error;

/**
 *  隐藏 HUD
 */
+ (void)hideHUD;

#pragma mark 下面的一般用不到

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message;

@end
