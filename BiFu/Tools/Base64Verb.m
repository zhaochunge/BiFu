//
//  Base64Verb.m
//  Yulindai
//
//  Created by zcg on 2018/3/22.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "Base64Verb.h"

@implementation Base64Verb

+(NSString *)JiaMiBase64:(NSString *)str{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Str= [data base64EncodedStringWithOptions:0];
    return base64Str;
}
+(NSDictionary *)JieMiBase64:(NSString *)str{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:str options:0];
    
    NSString *base64Str =[[NSString alloc]initWithData:data  encoding:NSUTF8StringEncoding];
    NSDictionary *dic =[self dictionaryWithJsonString:base64Str];
    
    return dic;
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
