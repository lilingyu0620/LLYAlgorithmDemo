//
//  BurstBalloons.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/10/18.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given n balloons, indexed from 0 to n-1. Each balloon is painted with a number on it represented by array nums. You are asked to burst all the balloons. If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins. Here left and right are adjacent indices of i. After the burst, the left and right then becomes adjacent.
//
//Find the maximum coins you can collect by bursting the balloons wisely.
//
//Note:
//
//You may imagine nums[-1] = nums[n] = 1. They are not real therefore you can not burst them.
//0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100
//Example:
//
//Input: [3,1,5,8]
//Output: 167
//Explanation: nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
//coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167

#import "BurstBalloons.h"

@implementation BurstBalloons{
    NSMutableArray *_resArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        int max = [self burstBalloons:@[@1,@3,@1,@5,@8,@1]];
        NSLog(@"max = %d",max);
        
    }
    return self;
}


- (int)burstBalloons:(NSArray *)array{
    
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[@0,@0,@0,@0,@0,@0]];
        [dp addObject:array];
    }
    
    for (int k = 2; k < array.count; k++) {
        
        for (int left = 0; left < array.count-k; left++) {
            
            int right = left+k;
            
            for (int i = left+1; i < right; i++) {
                dp[left][right] = @(MAX([dp[left][right] intValue], [array[left] intValue]*[array[i] intValue]*[array[right] intValue] + [dp[left][i] intValue] + [dp[i][right] intValue]));
            }
            
        }
        
    }
    
    return [dp[0][array.count - 1] intValue];
}

@end
