//
//  LixUserManager.h
//  Neuron
//
//  Created by Lix on 16/9/23.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LixUserManager : NSObject

+ (instancetype)shareInstance;

/**
 *  设备Vendor标识符
 */
@property (nonatomic, copy) NSString *deviceIDFV;


/**
 *  APP登录令牌
 */
@property (nonatomic, copy) NSString *accessToken;


/**
 *  用户名
 */
@property (nonatomic, copy) NSString *account;


/**
 *  清除设备Vendor标识符
 */
- (void)neu_removeDeviceIDFV;

/**
 *  保存用户登录信息
 *
 *  @param account  用户名
 *  @param password 密码
 */
- (void)saveAccount:(NSString *)account andPassword:(NSString *)password;

@end
