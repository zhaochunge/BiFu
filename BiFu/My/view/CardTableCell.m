//
//  CardTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/16.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "CardTableCell.h"

@implementation CardTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    UIImageView *img =[[UIImageView alloc] initWithFrame: CGRectMake(10, 10, WIDTH-20, 130)];
    img.image= [UIImage imageNamed:@"优惠券背景"];
    [self.contentView addSubview:img];
    self.leftLab =[UILabel new];
    [img addSubview:_leftLab];
    _leftLab.textColor =REDCOLOR;
    _leftLab.textAlignment = YES;
    _leftLab.font = [UIFont systemFontOfSize:25];
    self.leftNum =[UILabel new];
    _leftNum.font =[UIFont systemFontOfSize:15];
    _leftNum.textColor =[UIColor lightGrayColor];
    _leftNum.textAlignment = YES;
    [img addSubview:_leftNum];
    self.centerLab =[UILabel new];
    _centerLab.textAlignment = YES;
    _centerLab.font = [UIFont systemFontOfSize:18];
    [img addSubview:_centerLab];
    self.centerNum =[UILabel new];
    _centerNum.font =[UIFont systemFontOfSize:15];
    _centerNum.textColor =[UIColor lightGrayColor];
    _centerNum.textAlignment = YES;
    [img addSubview:_centerNum];
    self.useBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [img addSubview:_useBtn];
    _useBtn.layer.cornerRadius = 20;
    _useBtn.layer.masksToBounds = YES;
    [_useBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    _useBtn.backgroundColor =[UIColor colorWithRed:193/255.0 green:194/255.0 blue:195/255.0 alpha:1];
    self.discribLab =[UILabel new];
    _discribLab.textColor = [UIColor lightGrayColor];
    [img addSubview:_discribLab];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@5);
        make.top.mas_offset(@10);
        make.width.mas_equalTo((WIDTH-30)/3);
        make.height.mas_equalTo(@30);
    }];
    [_leftNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@5);
        make.top.mas_equalTo(_leftLab.mas_bottom).mas_offset(@0);
        make.width.mas_equalTo((WIDTH-30)/3);
        make.height.mas_equalTo(@30);
    }];
    [_centerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLab.mas_right).mas_offset(0);
        make.top.mas_offset(@10);
        make.width.mas_equalTo((WIDTH-30)/3+10);
        make.height.mas_equalTo(@30);
    }];
    [_centerNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLab.mas_right).mas_offset(0);
        make.top.mas_equalTo(_leftLab.mas_bottom).mas_offset(0);
        make.width.mas_equalTo((WIDTH-30)/3+10);
        make.height.mas_equalTo(@30);
    }];
    [_useBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(@-10);
        make.top.mas_offset(@20);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo((WIDTH-30)/4);
    }];
    [_discribLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@10);
        make.bottom.mas_offset(@-5);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@200);
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
