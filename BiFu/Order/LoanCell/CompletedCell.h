//
//  CompletedCell.h
//  BiFu
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CompletedCell : UITableViewCell
@property(nonatomic,strong)UILabel *numLab;
@property(nonatomic,strong)UILabel *loanLab;
@property(nonatomic,strong)UILabel *liLab;
@property(nonatomic,strong)UILabel *maLab;
@property(nonatomic,strong)UILabel *huanLab;
@property(nonatomic,strong)UILabel *newsLab;

@property(nonatomic,strong)UILabel *mnumLab;
@property(nonatomic,strong)UILabel *mloanLab;
@property(nonatomic,strong)UILabel *mliLab;
@property(nonatomic,strong)UILabel *mmaLab;
@property(nonatomic,strong)UILabel *mhuanLab;
@property(nonatomic,strong)UILabel *mnewsLab;

@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *payBtn;


@end

NS_ASSUME_NONNULL_END
