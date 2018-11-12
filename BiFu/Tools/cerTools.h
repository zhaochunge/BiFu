//
//  cerTools.h
//  Yulindai
//
//  Created by zcg on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cerTools : NSObject
#pragma mark 证件照
+(void)picDiscrib:(NSString *)str isShowTitle:(BOOL) isShow withFrame:(CGRect)frame view:(UIScrollView *)scroll;
#pragma mark 选择框
+(NSString *)chooseTitle:(NSString *)title withFrame:(CGRect)frame view:(UIScrollView *)scroll;
#pragma mark 输入框
+(NSString *)inputTitle:(NSString *)title withFrame:(CGRect )frame view:(UIScrollView *)scroll;
#pragma mark 标题和描述
+(void)title:(NSString *)title font:(CGFloat)font discrib:(NSString *)discrib withFrame:(CGRect )frame view:(UIScrollView *)scroll showLine:(BOOL)showLine;
@end
