//
//  MarketTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "MarketTableCell.h"

@implementation MarketTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.leftLab =[UILabel new];
    [self.contentView addSubview:_leftLab];
    self.leftNum =[UILabel new];
    _leftNum.font =[UIFont systemFontOfSize:15];
    _leftNum.textColor =[UIColor lightGrayColor];
    [self.contentView addSubview:_leftNum];
    self.centerLab =[UILabel new];
    _centerLab.textAlignment = YES;
    [self.contentView addSubview:_centerLab];
    self.centerNum =[UILabel new];
    _centerNum.font =[UIFont systemFontOfSize:15];
    _centerNum.textColor =[UIColor lightGrayColor];
    _centerNum.textAlignment = YES;
    [self.contentView addSubview:_centerNum];
    self.presnetLab =[UILabel new];
    _presnetLab.textColor =[UIColor whiteColor];
    _presnetLab.textAlignment = YES;
    self.presnetLab.backgroundColor =[UIColor colorWithRed:127/255.0 green:189/255.0 blue:83/255.0 alpha:1];
    [self.contentView addSubview:_presnetLab];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@15);
        make.top.mas_offset(@10);
        make.width.mas_equalTo((WIDTH-30)/3);
        make.height.mas_equalTo(@30);
    }];
    [_leftNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@15);
        make.top.mas_equalTo(_leftLab.mas_bottom).mas_offset(@0);
        make.width.mas_equalTo((WIDTH-30)/3);
        make.height.mas_equalTo(@30);
    }];
    [_centerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLab.mas_right).mas_offset(0);
        make.top.mas_offset(@10);
        make.width.mas_equalTo((WIDTH-30)/3);
        make.height.mas_equalTo(@30);
    }];
    [_centerNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLab.mas_right).mas_offset(0);
        make.top.mas_equalTo(_leftLab.mas_bottom).mas_offset(0);
        make.width.mas_equalTo((WIDTH-30)/3);
        make.height.mas_equalTo(@30);
    }];
    [_presnetLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-15);
        make.top.mas_offset(@20);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo((WIDTH-30)/4);
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
