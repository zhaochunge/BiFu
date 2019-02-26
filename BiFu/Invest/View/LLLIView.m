//
//  LLLIView.m
//  BiFu
//
//  Created by zcg on 2018/12/21.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LLLIView.h"

@implementation LLLIView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =REDCOLOR;
        self.shadow = [UIView new];
        self.shadow.frame = CGRectMake(5, 45, self.width-10, 20);
        self.shadow.backgroundColor = [UIColor colorWithRed:224/255.0 green:133/255.0 blue:130/255.0 alpha:1];
        self.shadow.layer.cornerRadius = 5;
        self.shadow.layer.masksToBounds = YES;
        [self addSubview:self.shadow];
        
        self.bacView = [UIView new];
        self.bacView.frame = CGRectMake(0, 0, self.width, 60);
        self.bacView.backgroundColor = [UIColor whiteColor];
        self.bacView.layer.cornerRadius = 5;
        self.bacView.layer.masksToBounds = YES;
        [self addSubview:self.bacView];
        //
        self.img = [UIImageView new];
        self.img.frame = CGRectMake(10, 15, 30, 30);
        self.img.layer.cornerRadius = 15;
        self.img.layer.masksToBounds = YES;
//        self.img.backgroundColor =[UIColor orangeColor];
        [self addSubview:self.img];
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(self.img.right+10, 5, self.width-120, 25)];
        _titleLab.adjustsFontSizeToFitWidth = YES;
        _titleLab.font =[UIFont systemFontOfSize:16];
        [self addSubview:_titleLab];
        self.numberLab = [[UILabel alloc] initWithFrame:CGRectMake(self.img.right+10, self.titleLab.bottom, self.width-120, 25)];
        _numberLab.adjustsFontSizeToFitWidth = YES;
        _numberLab.font =[UIFont systemFontOfSize:16];
        [self addSubview:_numberLab];
        
        self.userName =[UILabel new];
        self.userName.frame = CGRectMake(self.width-110, 5, 100, 25);
        self.userName.textAlignment= NSTextAlignmentRight;
        [self addSubview:_userName];
        
        self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(self.width-30, self.userName.bottom+5, 15, 15);
//        _btn.backgroundColor = [UIColor orangeColor];
        [_btn setBackgroundImage:[UIImage imageNamed:@"二维码-icon"] forState:(UIControlStateNormal)];
        [self addSubview:self.btn];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
