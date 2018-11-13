//
//  LIView.m
//  BiFu
//
//  Created by zcg on 2018/11/12.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LIView.h"

@implementation LIView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, self.width/5*2, self.height-30)];
        [self addSubview:_img];
        self.img.layer.masksToBounds = YES;
        self.img.layer.cornerRadius = 5;
        self.countLab = [[UILabel alloc] initWithFrame:CGRectMake(_img.right+5, 10, self.width-_img.width-10, (self.img.height)/3*2)];
        _countLab.font = [UIFont systemFontOfSize:26];
        _countLab.adjustsFontSizeToFitWidth = YES;

        [self addSubview:_countLab];
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(_img.right+5, _countLab.bottom, self.width-_img.width-10, (self.img.height)/3)];
        _titleLab.textColor = [UIColor lightGrayColor];
        _titleLab.adjustsFontSizeToFitWidth = YES;
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
