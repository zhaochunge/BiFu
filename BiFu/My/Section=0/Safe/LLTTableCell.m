//
//  LLTTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/26.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LLTTableCell.h"

@implementation LLTTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.titleLab =[UILabel new];
    self.titleLab.font =[UIFont systemFontOfSize:23];
    [self.contentView addSubview:self.titleLab];
    self.secLab = [UILabel new];
    self.secLab.text = @"旧密码";
    [self.contentView addSubview:self.secLab];
    self.oldPwd =[UITextField new];
    self.oldPwd.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.oldPwd];
    self.oldPwd.placeholder = @"请输入旧密码";
    self.oldPwd.secureTextEntry = YES;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLab.frame = CGRectMake(15, 0, WIDTH-30, 40);
    self.secLab.frame = CGRectMake(15, self.titleLab.bottom, 100, 30);
    self.oldPwd.frame = CGRectMake(125, self.titleLab.bottom, WIDTH-140, 30);
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
