//
//  NetTools.m
//  Yulindai
//
//  Created by zcg on 2018/3/22.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "NetTools.h"

@implementation NetTools

+(void)post:(NSString *)url parameters:(NSDictionary *)dic header:(NSString *)header success:(void(^)(id responseObject))success failure:(void(^)(NSError* error))failure{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (header.length>0) {
      [sessionManager.requestSerializer setValue:header forHTTPHeaderField:@"token"];
    }
    [sessionManager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)get:(NSString *)url parameters:(NSDictionary *)dic header:(NSString *)header success:(void(^)(id responseObject))success failure:(void(^)(NSError* error))failure{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (header.length>0) {
        [sessionManager.requestSerializer setValue:header forHTTPHeaderField:@"token"];
    }
    [sessionManager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        if (success) {
            success(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

@end
