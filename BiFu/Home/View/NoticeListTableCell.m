//
//  NoticeListTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/22.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "NoticeListTableCell.h"

@implementation NoticeListTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}
-(void)createView{
    self.img =[UIImageView new];
//    self.img.backgroundColor =[UIColor redColor];
    self.img.image =[UIImage imageNamed:@"公告-icon"];
    [self.contentView addSubview:self.img];
    self.titileLab =[UILabel new];
    [self.contentView addSubview:self.titileLab];
    self.dateLab =[UILabel new];
    self.dateLab.textColor =[UIColor lightGrayColor];
    self.dateLab.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.dateLab];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.img.frame = CGRectMake(15, 25, 20, 20);
    self.titileLab.frame =CGRectMake(self.img.right+20, 10, WIDTH-70, 30);
    self.dateLab.frame = CGRectMake(self.img.right+20, self.titileLab.bottom, WIDTH-70, 20);
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
