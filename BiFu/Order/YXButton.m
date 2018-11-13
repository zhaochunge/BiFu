//
//  YXButton.m
//  QuMeng
//
//  Created by apple on 2017/10/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YXButton.h"

@implementation YXButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat midX = self.frame.size.width / 2;
    CGFloat midY = self.frame.size.height/ 2 ;
    self.titleLabel.center = CGPointMake(midX, midY + 25);
    self.imageView.center = CGPointMake(midX, midY - 15);
    
}

@end
