//
//  NullValue.m
//  BiFu
//
//  Created by zcg on 2019/2/25.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "NullValue.h"

@implementation NullValue
NSString *SafeValue(id value) {
    if(!value) {
        return @"";
    }else if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"]) {
            return @"";
        }
        return value;
    }else {
        return [NSString stringWithFormat:@"%@",value];
    }
}

@end
