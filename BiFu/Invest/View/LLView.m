//
//  LLView.m
//  BiFu
//
//  Created by zcg on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LLView.h"

@implementation LLView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.width, (self.height)/3*2)];
        _countLab.font = [UIFont systemFontOfSize:26];
        _countLab.textAlignment = YES;
        _countLab.adjustsFontSizeToFitWidth = YES;
        _countLab.textColor =[UIColor whiteColor];
        
        [self addSubview:_countLab];
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, _countLab.bottom, self.width, (self.height)/3)];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.adjustsFontSizeToFitWidth = YES;
        _titleLab.textAlignment = YES;
        _titleLab.font =[UIFont systemFontOfSize:16];
        [self addSubview:_titleLab];
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
