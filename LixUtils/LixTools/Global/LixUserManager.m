//
//  LixUserManager.m
//  Neuron
//
//  Created by Lix on 16/9/23.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "LixUserManager.h"

@implementation LixUserManager

static LixUserManager *_instance = nil;

@synthesize account = _account;
@synthesize accessToken = _accessToken;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken ;
    
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _deviceIDFV = [[NSUserDefaults standardUserDefaults] objectForKey:DEVICE_IDFV];
        _accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:ACCESS_TOKEN];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

/**
 *  清除设备Vendor标识符
 */
- (void)neu_removeDeviceIDFV {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:DEVICE_IDFV];
    [userDefaults synchronize];
    [UIDevice lix_removeKeychainIDFV];
}

/**
 *  保存用户登录信息
 *
 *  @param account  用户名
 *  @param password 密码
 */
- (void)saveAccount:(NSString *)account andPassword:(NSString *)password {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:account forKey:ACCOUNT];
    [userDefaults synchronize];
    NSString *keyPassword = [[password stringByAppendingString:signKey] neu_md5String];
    NSString *savePassword = [NEUSecurityUtil neu_encryptAESData:keyPassword];
    [SAMKeychain setPassword:savePassword forService:Neuron account:account];
    NSLog(@"now password is %@", [SAMKeychain passwordForService:Neuron account:account]);
}

#pragma mark - set & get
/**
 *  设置设备Vendor标识符
 *
 *  @param deviceIDFV 应用厂商标识符
 */
- (void)setDeviceIDFV:(NSString *)deviceIDFV {
    if (_deviceIDFV != deviceIDFV) {
        _deviceIDFV = deviceIDFV;
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:deviceIDFV forKey:DEVICE_IDFV];
    [userDefaults synchronize];
}

/**
 *  设备APP登录令牌
 *
 *  @param accessToken 登录令牌
 */
- (void)setAccessToken:(NSString *)accessToken {
    if (_accessToken != accessToken) {
        _accessToken = accessToken;
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:accessToken forKey:ACCESS_TOKEN];
    [userDefaults synchronize];
}

/**
 *  保存用户名
 *
 *  @param account 用户名
 */
- (void)setAccount:(NSString *)account {
    if (_account != account) {
        _account = account;
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:account forKey:ACCOUNT];
    [userDefaults synchronize];
}

- (NSString *)account {
    if (!_account) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        _account = [userDefaults objectForKey:ACCOUNT];
    }
    return _account;
}

- (NSString *)accessToken {
    if (!_accessToken) {
         NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        _accessToken = [userDefaults objectForKey:ACCESS_TOKEN];
    }
    return _accessToken;
}

@end
