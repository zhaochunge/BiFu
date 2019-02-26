//
//  ThreeTitleTableCell.h
//  BiFu
//
//  Created by zcg on 2018/12/24.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThreeTitleTableCell : UITableViewCell
@property(nonatomic,strong)UILabel *rateNum;
@property(nonatomic,strong)UILabel *rateLab;
@property(nonatomic,strong)UILabel *borrowNum;
@property(nonatomic,strong)UILabel *borrowLab;
@property(nonatomic,strong)UILabel *dateNum;
@property(nonatomic,strong)UILabel *dateLab;
@property(nonatomic,strong)UIView *bacview;
@end

NS_ASSUME_NONNULL_END
