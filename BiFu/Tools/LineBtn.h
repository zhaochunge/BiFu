//
//  LineBtn.h
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LineBtn : UIButton
@property(nonatomic,strong)UIView *line;

+(LineBtn *)buttonWithType:(UIButtonType)type Frame:(CGRect)frame ButtonTitle:(NSString *)buttonTitle ButtonBackGroundColor:(UIColor *)buttonBackGroundColor ButtonBackgroundImage:(NSString *)buttonBackImage ButtonTitleColor:(UIColor *)buttonTitleColor;



@end
