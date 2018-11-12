//
//  HomeTableCellTableViewCell.h
//  BiFu
//
//  Created by zcg on 2018/11/12.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableCellTableViewCell : UITableViewCell
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UIView *circle;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *type;
@property(nonatomic,strong)UILabel *present;
@property(nonatomic,strong)UILabel *rate;
@property(nonatomic,strong)UILabel *moneyCount;
@property(nonatomic,strong)UILabel *moneyTitle;
@property(nonatomic,strong)UILabel *dateCount;
@property(nonatomic,strong)UILabel *dateTitle;

@end
