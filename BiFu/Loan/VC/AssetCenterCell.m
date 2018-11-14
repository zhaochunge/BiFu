//
//  AssetCenterCell.m
//  BiFu
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AssetCenterCell.h"

@implementation AssetCenterCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
    UIView *cellView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 290)];
    cellView.backgroundColor=LINECOLOR;
    [self.contentView addSubview:cellView];
    UIView *miniView=[[UIView alloc]initWithFrame:CGRectMake(30, 15, WIDTH-40, 290-30)];
    miniView.backgroundColor=[UIColor whiteColor];
    miniView.layer.cornerRadius=5;
    [cellView addSubview:miniView];
    
    _yuanLab=[[UILabel alloc]initWithFrame:CGRectMake(-20, 15, 40, 40)];
    _yuanLab.layer.cornerRadius=20;
    _yuanLab.layer.masksToBounds=YES;
    [miniView addSubview:_yuanLab];
    _leiLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, WIDTH*0.7, 30)];
    _leiLab.font=[UIFont systemFontOfSize:20];
    [miniView addSubview:_leiLab];
    _keLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.15, _leiLab.frame.origin.y+_leiLab.frame.size.height+30, 60, 30)];
    _keLab.textColor=[UIColor lightGrayColor];
    _keLab.text=@"可用";
    _keLab.font=[UIFont systemFontOfSize:18];
    [miniView addSubview:_keLab];
    _kmLab=[[UILabel alloc]initWithFrame:CGRectMake(_keLab.frame.origin.x+_keLab.frame.size.width, _leiLab.frame.origin.y+_leiLab.frame.size.height+30, 100, 30)];
    _kmLab.font=[UIFont systemFontOfSize:24];
    [miniView addSubview:_kmLab];
    _dongLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.15, _keLab.frame.origin.y+_keLab.frame.size.height+30, 60, 30)];
    _dongLab.textColor=[UIColor lightGrayColor];
    _dongLab.text=@"冻结";
    _dongLab.font=[UIFont systemFontOfSize:18];
    [miniView addSubview:_dongLab];
    _dmLab=[[UILabel alloc]initWithFrame:CGRectMake(_dongLab.frame.origin.x+_dongLab.frame.size.width, _keLab.frame.origin.y+_keLab.frame.size.height+30, 100, 30)];
    _dmLab.textColor=[UIColor lightGrayColor];
    _dmLab.font=[UIFont systemFontOfSize:24];
    [miniView addSubview:_dmLab];
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(40, _dmLab.frame.origin.y+_dmLab.frame.size.height+30, miniView.frame.size.width-80, 1)];
    line.backgroundColor=LINECOLOR;
    [miniView addSubview:line];
    /*
     @property(nonatomic,strong)UIButton *tiBtn;
     @property(nonatomic,strong)UIButton *chongBtn;
     */
    _tiBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _tiBtn.frame=CGRectMake(0, line.frame.origin.y+10, miniView.frame.size.width*0.5, 40);
    [_tiBtn setTitle:@"提现" forState:UIControlStateNormal];
    [_tiBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _tiBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [miniView addSubview:_tiBtn];
    
    _chongBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _chongBtn.frame=CGRectMake(miniView.frame.size.width*0.5, line.frame.origin.y+10, miniView.frame.size.width*0.5, 40);
    [_chongBtn setTitle:@"充值" forState:UIControlStateNormal];
    [_chongBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _chongBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [miniView addSubview:_chongBtn];
    
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
