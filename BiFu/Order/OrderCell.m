//
//  OrderCell.m
//  BiFu
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    
    _mnumLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 15, 20, 20)];
    _mnumLab.backgroundColor=[UIColor orangeColor];
    _mnumLab.layer.cornerRadius=10;
    _mnumLab.layer.masksToBounds=YES;
    [self addSubview:_mnumLab];
    _numLab=[[UILabel alloc]initWithFrame:CGRectMake(50, 15, WIDTH/2.0, 20)];
    _numLab.textColor=[UIColor blackColor];
    _numLab.font=[UIFont systemFontOfSize:19];
    [self addSubview:_numLab];
    _mloanLab=[[UILabel alloc]initWithFrame:CGRectMake(20, _mnumLab.frame.origin.y+_mnumLab.frame.size.height+15, WIDTH*0.7, 15)];
//    _mloanLab.text=@"借款金额（元）";
    _mloanLab.textColor=[UIColor lightGrayColor];
    [self addSubview:_mloanLab];
    _mliLab=[[UILabel alloc]initWithFrame:CGRectMake(20, _mloanLab.frame.origin.y+_mloanLab.frame.size.height+15, WIDTH*0.7, 15)];
//    _mliLab.text=@"利息（元）";
    _mliLab.textColor=[UIColor lightGrayColor];
    [self addSubview:_mliLab];
    _mmaLab=[[UILabel alloc]initWithFrame:CGRectMake(20, _mliLab.frame.origin.y+_mliLab.frame.size.height+15, WIDTH*0.7, 15)];
//    _mmaLab.text=@"付款码";
    _mmaLab.textColor=[UIColor lightGrayColor];
    [self addSubview:_mmaLab];
    
    
    
//    self.titleLab = [UILabel new];
//    [self addSubview:_titleLab];
//    self.status = [UILabel new];
//    self.status.textColor = [UIColor lightGrayColor];
//    [self addSubview:_status];
//    self.upLab = [UILabel new];
//    self.upLab.textAlignment = NSTextAlignmentRight;
//    self.upLab.text = @"立即上传";
//    _upLab.textColor = NAVCOLOR;
//    [self addSubview:_upLab];
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
