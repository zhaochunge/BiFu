//
//  ThreeTitleTableCell.m
//  BiFu
//
//  Created by zcg on 2018/12/24.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ThreeTitleTableCell.h"

@implementation ThreeTitleTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.backgroundColor = LINECOLOR;
    self.bacview = [UIView new];
    self.bacview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bacview];
    self.rateNum = [UILabel new];
    [self.contentView addSubview:self.rateNum];
    self.rateNum.textColor = REDCOLOR;
    self.rateNum.font = [UIFont systemFontOfSize:26];
    self.rateLab = [UILabel new];
    self.rateLab.text = @"年化利率";
    [self.contentView addSubview:self.rateLab];
    self.rateLab.textColor = [UIColor lightGrayColor];
    self.borrowLab = [UILabel new];
    self.borrowLab.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.borrowLab];
    self.borrowLab.text = @"借款金额(元)";
    self.borrowNum =[UILabel new];
    [self.contentView addSubview:self.borrowNum];
    self.borrowNum.textAlignment = YES;
    self.borrowLab.textAlignment = YES;
    self.dateLab = [UILabel new];
    [self.contentView addSubview:self.dateLab];
    self.dateLab.textColor = [UIColor lightGrayColor];
    self.dateLab.text = @"借款期限";
    self.dateNum =[UILabel new];
    [self.contentView addSubview:self.dateNum];
    self.dateNum.textAlignment = NSTextAlignmentRight;
    self.dateLab.textAlignment = NSTextAlignmentRight;
    self.dateNum.font = [UIFont systemFontOfSize:26];
    
    self.borrowNum.font = [UIFont systemFontOfSize:26];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = (WIDTH-30)/3;
    self.bacview.frame = CGRectMake(7, 0, WIDTH-14, 80);
    self.rateNum.frame = CGRectMake(15, 15, w, 30);
    self.rateLab.frame = CGRectMake(15, self.rateNum.bottom, w, 30);
    self.borrowNum.frame = CGRectMake(self.rateNum.right, 15, w, 30);
    self.borrowLab.frame =CGRectMake(self.rateNum.right, self.rateNum.bottom, w, 30);
    self.dateNum.frame = CGRectMake(self.borrowLab.right, 15, w, 30);
    self.dateLab.frame =CGRectMake(self.borrowLab.right, self.rateNum.bottom, w, 30);
    
    
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
