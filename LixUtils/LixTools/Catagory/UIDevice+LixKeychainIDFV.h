//
//  UIDevice+NEUKeychainIDFV.h
//  lix_KeychainIDFV
//
//  Created by Lix on 16/5/9.
//  Copyright © 2016年 neuron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (LixKeychainIDFV)

-(NSString *)lix_KeychainIDFV;

/**
 * 获取设备的Vendor标识符

 * @return 应用开发商标识符
 */
+(NSString *)lix_KeychainIDFV;

-(void)lix_removeKeychainIDFV;

/**
 * 清除设备的Vendor标识符
 */
+(void)lix_removeKeychainIDFV;

@end
