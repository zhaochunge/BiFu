//
//  OrderModel.h
//  BiFu
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject
@property(nonatomic,copy)NSString *dtype;
@property(nonatomic,copy)NSString *interest;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *pay_code;
@property(nonatomic,copy)NSString *pay_status;
@property(nonatomic,copy)NSString *pay_time;
@property(nonatomic,copy)NSString *sn;

@end

NS_ASSUME_NONNULL_END
