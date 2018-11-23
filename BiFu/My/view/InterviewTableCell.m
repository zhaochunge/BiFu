//
//  InterviewTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/22.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InterviewTableCell.h"

@implementation InterviewTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.userName =[UILabel new];
    [self.contentView addSubview:self.userName];
    self.userName.textColor =[UIColor lightGrayColor];
    self.dateTime =[UILabel new];
    [self.contentView addSubview:self.dateTime];
    self.dateTime.textColor =[UIColor lightGrayColor];
    self.rewardCount =[UILabel new];
    [self.contentView addSubview:self.rewardCount];
    self.rewardCount.textColor =[UIColor colorWithRed:171/255.0 green:122/255.0 blue:64/255.0 alpha:1];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.userName.frame = CGRectMake(15, 10, WIDTH/5, 30);
    self.dateTime.frame = CGRectMake(self.userName.right, 10, WIDTH/5*2, 30);
    self.rewardCount.frame = CGRectMake(WIDTH/5*4, 10, WIDTH/5, 30);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
