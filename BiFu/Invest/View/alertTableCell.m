//
//  alertTableCell.m
//  BiFu
//
//  Created by zcg on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "alertTableCell.h"

@implementation alertTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=LINECOLOR;
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.readBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_readBtn];
    [_readBtn setImage:[UIImage imageNamed:@"选中ICON"] forState:UIControlStateNormal];
    self.readLab =[UILabel new];
    _readLab.text = @"我已阅读并同意《借款协议》";
    _readLab.textColor = REDCOLOR;
    _readLab.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:_readLab];
    self.mesLab1 = [UILabel new];
    [self.contentView addSubview:_mesLab1];
    _mesLab1.text = @"1.平台暂不支持债权转让功能,确认投资后中途不可退出.";
    _mesLab1.font =[UIFont systemFontOfSize:15];
    _mesLab1.numberOfLines = 0;
    _mesLab1.textColor =[UIColor lightGrayColor];
    self.mesLab2 = [UILabel new];
    [self.contentView addSubview:_mesLab2];
    _mesLab2.text = @"2当日取消投资超过5次将被限制投资操作,需等24小时后方可继续操作.";
    _mesLab2.font =[UIFont systemFontOfSize:15];
    _mesLab2.numberOfLines = 0;
    _mesLab2.textColor =[UIColor lightGrayColor];
    self.mesLab3 = [UILabel new];
    [self.contentView addSubview:_mesLab3];
    _mesLab3.text = @"3.确认投资后,请务必仔细核实收款信息,尽快完成付款.";
    _mesLab3.font =[UIFont systemFontOfSize:15];
    _mesLab3.numberOfLines = 0;
    _mesLab3.textColor =[UIColor lightGrayColor];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _readBtn.frame = CGRectMake(10, 5, 20, 20);
    _readLab.frame = CGRectMake(_readBtn.right+5, 0, WIDTH-50, 30);
    CGRect rect1 = [_mesLab1.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    _mesLab1.frame = CGRectMake(10, _readBtn.bottom+10, self.contentView.width-20, rect1.size.height);
    CGRect rect2 = [_mesLab2.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    _mesLab2.frame = CGRectMake(10, _mesLab1.bottom+10, self.contentView.width-20, rect2.size.height);
    CGRect rect3 = [_mesLab2.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    _mesLab3.frame = CGRectMake(10, _mesLab2.bottom+10, self.contentView.width-20, rect3.size.height);
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
