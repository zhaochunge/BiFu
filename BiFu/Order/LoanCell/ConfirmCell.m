//
//  ConfirmCell.m
//  BiFu
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "ConfirmCell.h"

@implementation ConfirmCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    UIView *cellView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 137)];
    cellView.backgroundColor=LINECOLOR;
    [self.contentView addSubview:cellView];
    UIView *miniView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, WIDTH-20, 137-20)];
    miniView.backgroundColor=[UIColor whiteColor];
    miniView.layer.cornerRadius=5;
    [cellView addSubview:miniView];
    
    _mnumLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 20, 20)];
    _mnumLab.backgroundColor=[UIColor orangeColor];
    _mnumLab.layer.cornerRadius=10;
    _mnumLab.layer.masksToBounds=YES;
    [miniView addSubview:_mnumLab];
    _numLab=[[UILabel alloc]initWithFrame:CGRectMake(50, 10, WIDTH-70, 20)];
    _numLab.textColor=[UIColor blackColor];
    _numLab.font=[UIFont systemFontOfSize:19];
    [miniView addSubview:_numLab];
    
    _mloanLab=[[UILabel alloc]initWithFrame:CGRectMake(20, _mnumLab.frame.origin.y+_mnumLab.frame.size.height+10, WIDTH*0.4, 15)];
    _mloanLab.text=@"借款金额（元）";
    _mloanLab.textColor=[UIColor lightGrayColor];
    [miniView addSubview:_mloanLab];
    _loanLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.4, _numLab.frame.origin.y+_numLab.frame.size.height+10, WIDTH*0.3, 15)];
    [miniView addSubview:_loanLab];
    
    _mliLab=[[UILabel alloc]initWithFrame:CGRectMake(20, _mloanLab.frame.origin.y+_mloanLab.frame.size.height+10, WIDTH*0.4, 15)];
    _mliLab.text=@"利息（元）";
    _mliLab.textColor=[UIColor lightGrayColor];
    [miniView addSubview:_mliLab];
    _liLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.4, _mloanLab.frame.origin.y+_mloanLab.frame.size.height+10, WIDTH*0.3, 15)];
    [miniView addSubview:_liLab];
    
    _mmaLab=[[UILabel alloc]initWithFrame:CGRectMake(20, _mliLab.frame.origin.y+_mliLab.frame.size.height+10, WIDTH*0.7, 15)];
    _mmaLab.text=@"付款码";
    _mmaLab.textColor=[UIColor lightGrayColor];
    [miniView addSubview:_mmaLab];
    _maLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.4, _mliLab.frame.origin.y+_mliLab.frame.size.height+10, WIDTH*0.3, 15)];
    [miniView addSubview:_maLab];
    
    _mhuanLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.7, 50, WIDTH*0.3, 20)];
    _mhuanLab.text=@" 待确认";
    [miniView addSubview:_mhuanLab];
    _huanLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.7, 65, WIDTH*0.3, 30)];
    _huanLab.textColor=[UIColor redColor];
    [miniView addSubview:_huanLab];
    
    
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
