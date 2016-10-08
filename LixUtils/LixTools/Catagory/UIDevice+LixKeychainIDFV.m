//
//  UIDevice+NEUKeychainIDFV.m
//  lix_KeychainIDFV
//
//  Created by Lix on 16/5/9.
//  Copyright © 2016年 neuron. All rights reserved.
//

#import "UIDevice+LixKeychainIDFV.h"

@implementation UIDevice (LixKeychainIDFV)

+ (NSString *)lix_KeychainIDFV {
    return [[self currentDevice] lix_KeychainIDFV];
}

- (NSString *)lix_KeychainIDFV {
    NSString *idfv = [self lix_getIdfvFromKeyChain];

    if (idfv && idfv.length > 0 && [idfv isKindOfClass:[NSString class]]) {
        return idfv;
    } else {
        NSString *idfv = [[self identifierForVendor] UUIDString];
        idfv = [idfv stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [self lix_saveIdfvToKeyChain:idfv];
        return idfv;
    }
}


- (void)lix_removeKeychainIDFV {
    NSString *keychainKey = [[NSBundle mainBundle] bundleIdentifier];
    keychainKey = [keychainKey stringByAppendingString:@".VKIDFV"];
    [self lix_delete:keychainKey];
}

+ (void)lix_removeKeychainIDFV {
    [[self currentDevice] lix_removeKeychainIDFV];
}


- (void)lix_saveIdfvToKeyChain:(NSString *)idfv {
    NSString *keychainKey = [[NSBundle mainBundle] bundleIdentifier];
    keychainKey = [keychainKey stringByAppendingString:@".VKIDFV"];
    [self lix_save:keychainKey data:idfv];
}

- (NSString *)lix_getIdfvFromKeyChain {
    NSString *keychainKey = [[NSBundle mainBundle] bundleIdentifier];
    keychainKey = [keychainKey stringByAppendingString:@".VKIDFV"];
    NSString * idfv = [self lix_load:keychainKey];
    return idfv;
}


- (NSMutableDictionary *)lix_getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService,
            service, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

- (void)lix_save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self lix_getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}

- (id)lix_load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self lix_getKeychainQuery:service];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

- (void)lix_delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self lix_getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}

@end
