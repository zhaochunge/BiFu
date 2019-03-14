//
//  InvestOrderViewController.h
//  BiFu
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol returnInvestModelDelegate <NSObject>

- (void)invReceiveModel:(OrderModel *)model;

@end

@interface InvestOrderViewController : UIViewController

@property(nonatomic,assign)id<returnInvestModelDelegate>delegate;
//@property(nonatomic,strong)OrderModel *model;


@end

NS_ASSUME_NONNULL_END
