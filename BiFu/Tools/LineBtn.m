//
//  LineBtn.m
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "LineBtn.h"

@implementation LineBtn
+(LineBtn *)buttonWithType:(UIButtonType)type Frame:(CGRect)frame ButtonTitle:(NSString *)buttonTitle ButtonBackGroundColor:(UIColor *)buttonBackGroundColor ButtonBackgroundImage:(NSString *)buttonBackImage ButtonTitleColor:(UIColor *)buttonTitleColor
{
    //创建按钮对象
    LineBtn *button = [LineBtn buttonWithType:type];
    
    //设置按钮尺寸
    button.frame = frame;
    
    //设置按钮标题
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    
    //设置按钮背景色
    button.backgroundColor = buttonBackGroundColor;
    
    //设置按钮背景图
    [button setBackgroundImage:[UIImage imageNamed:buttonBackImage] forState:UIControlStateNormal];
    
    //设置按钮文字居中
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    //
    [button setTitleColor:buttonTitleColor forState:(UIControlStateNormal)];
    
    button.line = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/2-20, button.titleLabel.bottom+15, 40, 1)];
//    button.line.backgroundColor = buttonTitleColor;
    [button addSubview:button.line];
    //返回一个按钮
    return button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
