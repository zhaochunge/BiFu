//
//  LTView.m
//  BiFu
//
//  Created by zcg on 2018/11/26.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LTView.h"

@implementation LTView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLab =[UILabel new];
        self.titleLab.frame = CGRectMake(15, 0, 100,self.height);
        [self addSubview:self.titleLab];
        self.pwd =[UITextField new];
        self.pwd.frame = CGRectMake(120, 0, self.width-130, self.height);
        [self addSubview:self.pwd];
        self.pwd.textAlignment = NSTextAlignmentRight;
        self.pwd.secureTextEntry = YES;
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
