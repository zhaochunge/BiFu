//
//  NetTools.h
//  Yulindai
//
//  Created by zcg on 2018/3/22.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AFNetworking.h"

@interface NetTools : NSObject

#pragma mark post请求
+(void)post:(NSString *)url parameters:(NSDictionary *)dic header:(NSString *)header success:(void(^)(id responseObject))success failure:(void(^)(NSError* error))failure;
#pragma mark get请求
+(void)get:(NSString *)url parameters:(NSDictionary *)dic header:(NSString *)header success:(void(^)(id responseObject))success failure:(void(^)(NSError* error))failure;

#pragma mark json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
