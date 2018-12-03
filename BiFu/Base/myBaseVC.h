//
//  myBaseVC.h
//  BiFu
//
//  Created by zcg on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myBaseVC : UIViewController
//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color;
//返回按钮
-(void)leftItem;
-(void)leftItemBlack;
-(void)showMessage:(NSString *)str;
-(void)openCountdown:(UIButton *)btn;
@property (nonatomic,strong) MBProgressHUD* hud;//弹出提示
@property(nonatomic ,strong) UITextField * firstResponderTextF;//记录将要编辑的输入框
@end
