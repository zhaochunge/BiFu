//
//  NullValue.h
//  BiFu
//
//  Created by zcg on 2019/2/25.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NullValue : NSObject
/**
 * 过滤value中的空值 -----引入头文件后，在需要的地方直接这样写SafeValue(你需要判断过滤的值)
 */
NSString *SafeValue(id value);
@end

NS_ASSUME_NONNULL_END
