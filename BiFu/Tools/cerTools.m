//
//  cerTools.m
//  Yulindai
//
//  Created by zcg on 2018/4/13.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "cerTools.h"

@implementation cerTools
#pragma mark 证件照
+(void)picDiscrib:(NSString *)str isShowTitle:(BOOL) isShow withFrame:(CGRect)frame view:(UIScrollView *)scroll{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [scroll addSubview:view];
    UILabel *titleLab = [UILabel new];
    if (isShow == YES) {
        titleLab.frame =CGRectMake(0, 10, 200, 30);
        titleLab.text = str;
        [view addSubview:titleLab];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, titleLab.bottom+10, WIDTH-40, 150);
    [view addSubview:btn];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.backgroundColor = [UIColor colorWithRed:247/255.0 green:246/255.0 blue:241/255.0 alpha:1];
//    return view;

}
#pragma mark 选择框
+(NSString *)chooseTitle:(NSString *)title withFrame:(CGRect)frame view:(UIScrollView *)scroll{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [scroll addSubview:view];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 80, 30)];
    titleLab.text = title;
    [view addSubview:titleLab];
    UILabel *chooseLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, WIDTH-170, 30)];
    chooseLab.textColor = [UIColor lightGrayColor];
    [view addSubview:chooseLab];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH-70, 10, 30, 30);
    [btn setImage:[UIImage imageNamed:@"三角"] forState:(UIControlStateNormal)] ;
    [view addSubview:btn];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, titleLab.bottom+9, WIDTH-40, 1)];
    line.backgroundColor = LINECOLOR;
    [view addSubview:line];
    return chooseLab.text;
}
#pragma mark 输入框
+(NSString *)inputTitle:(NSString *)title withFrame:(CGRect )frame view:(UIScrollView *)scroll{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [scroll addSubview:view];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 80, 30)];
    titleLab.text = title;
    [view addSubview:titleLab];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
    textField.delegate = self;
    [view addSubview:textField];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, titleLab.bottom+9, WIDTH-40, 1)];
    line.backgroundColor = LINECOLOR;
    [view addSubview:line];
    return textField.text;
}
#pragma mark 标题和描述
+(void)title:(NSString *)title font:(CGFloat )font discrib:(NSString *)discrib withFrame:(CGRect )frame view:(UIScrollView *)scroll showLine:(BOOL)showLine{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [scroll addSubview:view];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, WIDTH-40, 30)];
    titleLab.text = title;
    titleLab.font = [UIFont systemFontOfSize:font];
    [view addSubview:titleLab];
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    CGSize size=[discrib boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    UILabel *lab = [[UILabel alloc] init];
    lab.text = discrib;
    lab.font = [UIFont systemFontOfSize:13];
    lab.numberOfLines = 0;
    lab.textColor = [UIColor lightGrayColor];
    lab.frame = CGRectMake(0, titleLab.bottom, WIDTH-40, size.height);
    [view addSubview:lab];
    if (showLine == YES) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, lab.bottom+5, WIDTH-40, 1)];
        line.backgroundColor = LINECOLOR;
        [view addSubview:line];
    }
    
    
}

@end
