//
//  CustomAlertView.h
//  Yulindai
//
//  Created by zcg on 2018/3/30.
//  Copyright © 2018年 zcg. All rights reserved.
//
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kBCAlertViewPresentNotify   @"kBCAlertViewPresentNotify"  //alertview present notify

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@class CustomAlertView;

@protocol CustomAlertViewDelegate <NSObject>

@optional

// - 代理方法
-(void)alertView:(CustomAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)alertViewClosed:(CustomAlertView *)alertView;
-(void)willPresentCustomAlertView:(UIView *)alertView;

// - 隐藏实用类弹出键盘
- (void)hideCurrentKeyBoard;

@end

@interface CustomAlertView : UIView

@property (nonatomic, assign) id <CustomAlertViewDelegate> delegate;
@property (nonatomic, assign) BOOL           isNeedCloseBtn;  // - 左上角带叉叉按钮
@property (nonatomic, retain) NSString       *title;
@property (nonatomic, retain) NSString       *message;
@property (nonatomic, retain) UIView         *backView;
@property (nonatomic, retain) UIView         *titleBackgroundView;
@property (nonatomic, retain) UILabel        *titleLabel;
@property (nonatomic, retain) UIImageView    *titleIcon;
@property (nonatomic, retain) NSMutableArray *customerViewsToBeAdd;

- (id)initWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate cancelButtonTitle:(NSString*)cancelButtonTitle otherButtonTitles:(NSString*)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

-(void)initTitle:(NSString*)title message:(NSString*)message delegate:(id)del cancelButtonTitle:(NSString*)cancelBtnTitle otherButtonTitles:(NSString*)otherBtnTitles, ...NS_REQUIRES_NIL_TERMINATION;

- (void) show ;

// - 在alertview中添加自定义控件
- (void)addCustomerSubview:(UIView *)view;

+ (void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur;

+ (CustomAlertView *)defaultAlert;  
@end
