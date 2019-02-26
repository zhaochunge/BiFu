//
//  InvestDetialTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InvestDetialTableCell.h"

@implementation InvestDetialTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.titleLab =[UILabel new];
    [self.contentView addSubview:_titleLab];
    _titleLab.textColor =[UIColor lightGrayColor];
    self.mesLab =[UILabel new];
    [self.contentView addSubview:_mesLab];
    _mesLab.textAlignment = NSTextAlignmentRight;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@15);
        make.top.mas_offset(@5);
        make.bottom.mas_offset(@-5);
        make.width.mas_equalTo(self.contentView.width/2);
    }];
    [_mesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-15);
        make.top.mas_offset(@5);
        make.bottom.mas_offset(@-5);
        make.width.mas_equalTo(self.contentView.width/3*2);
    }];
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
