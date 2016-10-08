//
//  LixUtils.h
//  Neuron
//
//  Created by Lix on 16/8/22.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LixUtils : NSObject

#pragma mark - 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
#pragma mark - 正则匹配用户名6-12位字母和数字组合
+ (BOOL)checkAccount:(NSString *) account;
#pragma mark - 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
#pragma mark - 正则匹配短信验证码4位数字组合
+ (BOOL)checkVerificationCode:(NSString *)verificationCode;
#pragma mark - 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
#pragma mark - 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
#pragma mark - 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;
#pragma mark - 验证是否有空格
+ (BOOL)isHaveSpaceInString:(NSString *)string;
#pragma mark - 验证是否有中文
+ (BOOL)isHaveChineseInString:(NSString *)string;
#pragma mark - 细致匹配手机号
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
@end
