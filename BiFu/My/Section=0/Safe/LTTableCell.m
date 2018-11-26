//
//  LTTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/26.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LTTableCell.h"

@implementation LTTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.titleLab =[UILabel new];
    [self.contentView addSubview:self.titleLab];
    self.pwd =[UITextField new];
    [self.contentView addSubview:self.pwd];
    self.pwd.textAlignment = NSTextAlignmentRight;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLab.frame = CGRectMake(15, 0, 100, 30);
    self.pwd.frame = CGRectMake(120, 0, WIDTH-140, 30);
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
