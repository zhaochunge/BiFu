//
//  Base64Verb.h
//  Yulindai
//
//  Created by zcg on 2018/3/22.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64Verb : NSObject
#pragma mark base64加密
+(NSString *)JiaMiBase64:(NSString *)str;
#pragma mark base64解密
+(NSDictionary *)JieMiBase64:(NSString *)str;
#pragma mark json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
