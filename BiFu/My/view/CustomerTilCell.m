//
//  CustomerTilCell.m
//  BiFu
//
//  Created by zcg on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "CustomerTilCell.h"

@implementation CustomerTilCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.img =[UIImageView new];
    self.img.layer.cornerRadius = 15;
    self.img.layer.masksToBounds = YES;
    [self.contentView addSubview:self.img];
    self.titleLab =[UILabel new];
    self.titleLab.font =[UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.titleLab];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.img.frame = CGRectMake(0, 10, 30, 30);
    self.titleLab.frame = CGRectMake(_img.right+10, 10, self.contentView.width-50, 30);
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
