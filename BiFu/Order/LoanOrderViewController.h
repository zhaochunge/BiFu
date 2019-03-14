//
//  LoanOrderViewController.h
//  BiFu
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol returnLoanModelDelegate <NSObject>

- (void)loanReceiveModel:(OrderModel *)model;

@end

@interface LoanOrderViewController : UIViewController

@property(nonatomic,assign)id<returnLoanModelDelegate>delegate;

//@property(nonatomic,strong)OrderModel *model;


@end

NS_ASSUME_NONNULL_END
