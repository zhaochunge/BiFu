//
//  CustomerTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "CustomerTableCell.h"

@implementation CustomerTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.userLab = [UILabel new];
    [self.contentView addSubview:self.userLab];
    self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setBackgroundImage:[UIImage imageNamed:@"复制"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.btn];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.userLab.frame = CGRectMake(20, 0, self.contentView.width-60, 50);
    self.btn.frame = CGRectMake(_userLab.right, 15, 20, 20);
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
