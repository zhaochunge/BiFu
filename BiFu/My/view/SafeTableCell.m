//
//  SafeTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/20.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "SafeTableCell.h"

@implementation SafeTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.titleLab =[UILabel new];
    [self.contentView addSubview:self.titleLab];
    self.titleLab.font = [UIFont systemFontOfSize:20];
    self.titleLab.text = @"账户安全";
    self.icon =[UIImageView new];
    self.icon.image =[UIImage imageNamed:@"账户安全-icon"];
    [self.contentView addSubview:self.icon];
    self.dislab =[UILabel new];
    self.dislab.textColor =[UIColor lightGrayColor];
    self.dislab.text = @"智能保障账户安全";
    self.dislab.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.dislab];
    self.headImg =[UIImageView new];
    self.headImg.layer.masksToBounds = YES;
    self.headImg.layer.cornerRadius = 25;
    self.headImg.backgroundColor=[UIColor yellowColor];
    [self.contentView addSubview:self.headImg];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLab.frame = CGRectMake(20, 5, 200, 40);
    self.icon.frame = CGRectMake(20, self.titleLab.bottom, 20, 20);
    self.dislab.frame = CGRectMake(self.icon.right, self.titleLab.bottom, 200, 20);
    self.headImg.frame = CGRectMake(WIDTH-70, 10, 50, 50);
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
