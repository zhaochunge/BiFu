//
//  LLBView.m
//  BiFu
//
//  Created by zcg on 2019/3/12.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "LLBView.h"

@implementation LLBView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =REDCOLOR;
        
    
        self.payWay = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 90, self.height)];
        [self addSubview:_payWay];
        
        self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(self.width-30, 5, 20, self.height-10);
        [_btn setBackgroundImage:[UIImage imageNamed:@"二维码-icon"] forState:(UIControlStateNormal)];
        [self addSubview:self.btn];
        
        self.numberLab =[[UILabel alloc] initWithFrame:CGRectMake(100, 0, self.width-140, self.height)];
        self.numberLab.textAlignment= NSTextAlignmentRight;
        [self addSubview:_numberLab];
        
    }
    return self;
}
@end
