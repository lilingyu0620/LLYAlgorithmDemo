//
//  SumOfTwoIndex.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2020/5/31.
//  Copyright © 2020 lly. All rights reserved.
//
//  返回数组中两数相加等于指定值的所有索引
//  [5,7,5,3,6,2,4,8] sum = 10
//  返回 [0,2] [1,3] [4,6] [5,7]

#import "SumOfTwoIndex.h"

@implementation SumOfTwoIndex

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *array = [self twoIndexs:@[@5,@7,@5,@3,@6,@2,@4,@8] sum:10];
        NSLog(@"array = %@",array);
    }
    return self;
}

- (NSArray<NSArray *> *)twoIndexs:(NSArray *)sourceArray sum:(NSInteger)sum {
    
    if (sourceArray.count <= 0) {
        return nil;
    }
    
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i < sourceArray.count; i++) {
        NSMutableArray *array = [NSMutableArray array];
        for (int j = 0; j < i; j++) {
            [array addObject:@0];
        }
        array[i] = sourceArray[i];
        dp[i] = array;
    }

    NSMutableArray *result = [NSMutableArray array];
    
    for (int i = 1; i < sourceArray.count; i++) {
                
        NSArray *dp1 = dp[i-1];
        int dp1Value = [dp1[i-1] intValue];
        
        NSMutableArray *dp2 = dp[i];
        int dp2Value = [dp2[i] intValue];

        for (int j = 0; j < i; j++) {
            int curdp = 0;
            if (j == i-1) {
                curdp = dp1Value + dp2Value;
            }
            else {
                int dpValue = [dp1[j] intValue]; // 取dp
                curdp = dpValue - dp1Value + dp2Value;
            }
            dp2[j] = @(curdp);
            if (curdp == sum) {
                [result addObject:@[@(j),@(i)]];
            }
        }
        
    }
    
    return result;
}

@end
