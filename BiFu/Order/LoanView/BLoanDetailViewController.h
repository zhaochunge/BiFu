//
//  BLoanDetailViewController.h
//  BiFu
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
#import "LabelView.h"


NS_ASSUME_NONNULL_BEGIN

@interface BLoanDetailViewController : UIViewController
@property(nonatomic,strong)OrderModel *model;
@property(nonatomic,strong)UILabel * titleLabel;


@end

NS_ASSUME_NONNULL_END
