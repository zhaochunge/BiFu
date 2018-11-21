//
//  CheckSecondTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/20.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "CheckSecondTableCell.h"

@implementation CheckSecondTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.leftLab =[UILabel new];
    [self.contentView addSubview:self.leftLab];
    self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setImage:[UIImage imageNamed:@"打开"] forState:(UIControlStateNormal)];
    [self.contentView addSubview:self.btn];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.leftLab.frame = CGRectMake(20, 10, 200, 30);
    self.btn.frame = CGRectMake(WIDTH-70, 15, 50, 20);
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
