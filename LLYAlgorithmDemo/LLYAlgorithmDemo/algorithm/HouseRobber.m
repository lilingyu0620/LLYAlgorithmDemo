//
//  HouseRobber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/16.
//  Copyright © 2018年 lly. All rights reserved.
//
//
//
//You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
//
//Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
//
//Example 1:
//
//Input: [1,2,3,1]
//Output: 4
//Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
//Total amount you can rob = 1 + 3 = 4.
//Example 2:
//
//Input: [2,7,9,3,1]
//Output: 12
//Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
//Total amount you can rob = 2 + 9 + 1 = 12.


#import "HouseRobber.h"

@implementation HouseRobber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int sum = [self houseRobber:@[@1,@2,@3,@1] index:3];
//        int sum = [self houseRobber:@[@2,@7,@9,@3,@1] index:4];
//        int sum = [self houseRobber:@[@2,@1,@1,@2] index:3];

        int sum = [self houseRobber:@[@2,@3,@2]];
        NSLog(@"sum = %d",sum);
        
    }
    return self;
}

- (int)houseRobber:(NSArray *)array index:(int)index{
    
    if (index < 0) {
        return 0;
    }
    
    if(index == 0)
        return [array[index] intValue];
    
    if (index == 1) {
        return MAX([array[index] intValue], [array[index-1] intValue]);
    }
    
    return MAX([array[index] intValue] + MAX([self houseRobber:array index:index-2], [self houseRobber:array index:index-3]), [array[index-1] intValue] + MAX([self houseRobber:array index:index-3], [self houseRobber:array index:index-4]));
}


- (int)houseRobber:(NSArray *)array{
    
    if (array.count == 0) {
        return 0;
    }
    if (array.count == 1) {
        return [array[0] intValue];
    }
    if (array.count == 2){
        return MAX([array[0] intValue], [array[1] intValue]);
    }
    
    NSMutableArray *dpArray = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        
        int maxPre = i-2 >=0 ? [dpArray[i-2] intValue] : 0;
        maxPre = i-3 >= 0 ? MAX([dpArray[i-3] intValue], maxPre) : 0;
        [dpArray addObject:@([array[i] intValue] + maxPre)];
        
    }
    
    return MAX([dpArray[dpArray.count - 1] intValue], [dpArray[dpArray.count - 2] intValue]);
    
}

@end
