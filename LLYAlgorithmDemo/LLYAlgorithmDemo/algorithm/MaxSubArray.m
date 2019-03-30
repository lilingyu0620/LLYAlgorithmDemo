//
//  MaxSubArray.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/3/30.
//  Copyright © 2019 lly. All rights reserved.
//
//  子数组最大值
//

#import "MaxSubArray.h"

@implementation MaxSubArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSInteger sum = [self maxSubArray:@[@1,@-2,@3,@10,@-4,@7,@2,@-5]];
//        NSInteger sum = [self maxSubArray:@[@-2,@5,@3,@-6,@4,@-8,@6]];
        NSLog(@"sum = %ld",sum);
        
    }
    return self;
}

- (NSInteger)maxSubArray:(NSArray *)array{
    
    NSInteger curMax = 0;
    NSInteger preMax = 0;
    
    for (int i = 0; i < array.count; i++) {
        
        NSInteger num = [array[i] integerValue];
        
        //当前值加上之前的累加和后小于当前值 则说明之前的累加和是负数 可以从当前值开始从新累加
        if (num > num+curMax) {
            curMax = num;
        }
        else{
            curMax += num;
        }
        
        preMax = MAX(preMax, curMax);
    }
    
    return preMax;
    
}

@end
