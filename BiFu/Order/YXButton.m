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
    CGFloat midX = self.frame.size.width/2.0;
    CGFloat midY = self.frame.size.height/2.0 ;
    self.titleLabel.center = CGPointMake(midX, midY +30);
    self.imageView.center = CGPointMake(midX, midY - 15);
    
}
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    if (self=[super initWithCoder:aDecoder]) {
//        [self commonInit];
//    }
//    return self;
//}
//
//-(id)initWithFrame:(CGRect)frame{
//    if (self=[super initWithFrame:frame]) {
//        [self commonInit];
//    }
//    return self;
//}
//
//-(void)commonInit{
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    self.titleLabel.font = [UIFont systemFontOfSize:14];
//}
//
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    CGFloat titleX = 0;
//    CGFloat titleY = contentRect.size.height *0.75;
//    CGFloat titleW = contentRect.size.width;
//    CGFloat titleH = contentRect.size.height - titleY;
//    return CGRectMake(titleX, titleY, titleW, titleH);
//}
//
//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    CGFloat imageW = CGRectGetWidth(contentRect);
//    CGFloat imageH = contentRect.size.height * 0.7;
//    return CGRectMake(0, 0, imageW, imageH);
//}

@end
