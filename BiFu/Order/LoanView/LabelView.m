//
//  LabelView.m
//  BiFu
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "LabelView.h"

@implementation LabelView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _topLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.width-10, self.height/2.0-10)];
        _topLab.textColor = [UIColor whiteColor];
        _topLab.adjustsFontSizeToFitWidth = YES;
        _topLab.textAlignment = YES;
        [self addSubview:_topLab];
        
        _bottomLab = [[UILabel alloc]initWithFrame:CGRectMake(5, self.height/2.0+5, self.width-10, self.height/2.0-10)];
        _bottomLab.textColor = [UIColor whiteColor];
        _bottomLab.adjustsFontSizeToFitWidth = YES;
        _bottomLab.textAlignment = YES;
        [self addSubview:_bottomLab];
        
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
