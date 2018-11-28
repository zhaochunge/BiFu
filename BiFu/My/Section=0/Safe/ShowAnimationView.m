//
//  ShowAnimationView.m
//  BiFu
//
//  Created by zcg on 2018/11/27.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ShowAnimationView.h"
@interface ShowAnimationView ()

//@property (nonatomic, strong) UIView  *contentView;
@end
@implementation ShowAnimationView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubviews];
    }
    return self;
}

- (void)layoutAllSubviews{
    
    /*创建灰色背景*/
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.alpha = 0.5;
    bgView.backgroundColor = [UIColor grayColor];
    [self addSubview:bgView];
    
    
    /*添加手势事件,移除View*/
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissContactView:)];
    [bgView addGestureRecognizer:tapGesture];
    
    /*创建显示View*/
    _contentView = [[UIView alloc] init];
    _contentView.frame = CGRectMake(20, self.frame.size.height/2-200, self.frame.size.width - 40, 300);
    _contentView.backgroundColor=[UIColor whiteColor];
    _contentView.layer.cornerRadius = 15;
    _contentView.layer.masksToBounds = YES;
    UIImageView *img =[UIImageView new];
    img.frame =CGRectMake(0, 0, _contentView.width, 300);
    img.image =[UIImage imageNamed:@"锁头"];
    [_contentView addSubview:img];
    [self addSubview:_contentView];
    /*可以继续在其中添加一些View 虾米的*/
    
}
#pragma mark - 手势点击事件,移除View
- (void)dismissContactView:(UITapGestureRecognizer *)tapGesture{
    
    [self dismissContactView];
}

-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
    
}

// 这里加载在了window上
-(void)showView
{
//    UIWindow * window = [UIApplication sharedApplication].windows[0];
//    [window addSubview:self];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)dispear{
    [self dismissContactView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
