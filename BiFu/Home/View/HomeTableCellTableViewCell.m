//
//  HomeTableCellTableViewCell.m
//  BiFu
//
//  Created by zcg on 2018/11/12.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "HomeTableCellTableViewCell.h"

@implementation HomeTableCellTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.backView = [UIView new];
    self.backView.backgroundColor =[UIColor whiteColor];
    self.backView.layer.borderWidth=1;
    self.backView.layer.borderColor =[UIColor colorWithRed:235/255.0 green:238/255.0 blue:241/255.0 alpha:1].CGColor;
    _backView.layer.cornerRadius=5;
    _backView.layer.masksToBounds = YES;
    [self.contentView addSubview:_backView];
    self.circle =[UIView new];
    self.circle.layer.masksToBounds = YES;
    self.circle.layer.cornerRadius =10;
    _circle.backgroundColor =[UIColor colorWithRed:228/255.0 green:166/255.0 blue:117/255.0 alpha:1];
    [_backView addSubview:_circle];
    //
    self.title = [UILabel new];
    _title.font =[UIFont systemFontOfSize:20];
    [_backView addSubview:_title];
    self.type = [UILabel new];
    _type.backgroundColor = [UIColor colorWithRed:125/255.0 green:191/255.0 blue:244/255.0 alpha:1];
    _type.textColor =[UIColor whiteColor];
    _type.layer.cornerRadius =5;
    _type.textAlignment = YES;
    _type.layer.masksToBounds = YES;
    [_backView addSubview:_type];
    self.present = [UILabel new];
    _present.textColor = [UIColor redColor];
    _present.font = [UIFont systemFontOfSize:25];
    _present.textAlignment = YES;
    [_backView addSubview:_present];
    self.rate = [UILabel new];
    self.rate.font =[UIFont systemFontOfSize:15];
    _rate.textColor=[UIColor lightGrayColor];
    _rate.textAlignment = YES;
    [_backView addSubview:_rate];
    self.moneyCount = [UILabel new];
    _moneyCount.font =[UIFont systemFontOfSize:20];
    _moneyCount.textAlignment = YES;
    [_backView addSubview:_moneyCount];
    self.moneyTitle = [UILabel new];
    self.moneyTitle.font =[UIFont systemFontOfSize:15];
    _moneyTitle.textColor=[UIColor lightGrayColor];
    _moneyTitle.textAlignment = YES;
    [_backView addSubview:_moneyTitle];
    self.dateCount = [UILabel new];
    _dateCount.font =[UIFont systemFontOfSize:20];
    _dateCount.textAlignment = YES;
    [_backView addSubview:_dateCount];
    self.dateTitle = [UILabel new];
    self.dateTitle.font =[UIFont systemFontOfSize:15];
    _dateTitle.textColor=[UIColor lightGrayColor];
    _dateTitle.textAlignment = YES;
    [_backView addSubview:_dateTitle];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger w =(self.width-20)/3;
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@10);
        make.top.mas_offset(@10);
        make.bottom.mas_offset(@0);
        make.right.mas_offset(@-10);
    }];
    
    [self.circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(@20);
        make.top.mas_offset(@10);
        make.width.mas_equalTo(@20);
        make.height.mas_equalTo(@20);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(_circle.mas_right).mas_offset(@5);
        make.top.mas_equalTo(_circle.mas_top);
        make.width.mas_equalTo(@150);
        make.height.mas_equalTo(_circle.mas_height);
    }];
    [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(_title.mas_right).mas_offset(@10);
        make.width.mas_equalTo(@60);
        make.height.mas_equalTo(_title.mas_height);
        make.top.mas_equalTo(_title.mas_top);
    }];
    [_present mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
    make.top.mas_equalTo(_circle.mas_bottom).mas_offset(@15);
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(@30);
    }];
    [_moneyCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(@30);
    make.top.mas_equalTo(_circle.mas_bottom).mas_offset(@15);
        make.left.mas_equalTo(_present.mas_right);
    }];
    [_dateCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(_circle.mas_bottom).mas_offset(@15);
        make.left.mas_equalTo(_moneyCount.mas_right);
    }];
    [_rate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(_present.mas_bottom).mas_offset(@5);
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(@30);
    }];
    [_moneyTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(_present.mas_bottom).mas_offset(@5);
        make.left.mas_equalTo(_present.mas_right);
    }];
    [_dateTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(@30);
        make.top.mas_equalTo(_present.mas_bottom).mas_offset(@5);
        make.left.mas_equalTo(_moneyCount.mas_right);
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
