//
//  OrderMsgTableCell.m
//  BiFu
//
//  Created by zcg on 2018/12/24.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "OrderMsgTableCell.h"

@implementation OrderMsgTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.contentView.backgroundColor = LINECOLOR;
    self.backView = [UIView new];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.backView];
    self.left =[UILabel new];
    [self.backView addSubview:self.left];
    self.left.textColor = [UIColor lightGrayColor];
    self.right =[UILabel new];
    self.right.textAlignment = NSTextAlignmentRight;
    [self.backView addSubview:self.right];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.backView.frame = CGRectMake(7, 0, WIDTH-14, 40);
    self.left.frame = CGRectMake(8, 0, (WIDTH-30)/3*2, 40);
    self.right.frame = CGRectMake((WIDTH-30)/3+8, 0, (WIDTH-30)/3*2, 40);
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
