//
//  CoinChange.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/11/1.
//  Copyright © 2018 lly. All rights reserved.
//


//You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
//
//Example 1:
//
//Input: coins = [1, 2, 5], amount = 11
//Output: 3
//Explanation: 11 = 5 + 5 + 1
//Example 2:
//
//Input: coins = [2], amount = 3
//Output: -1

#import "CoinChange.h"

@implementation CoinChange

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int coinNum = [self coinChange:@[@5,@2,@1] target:11];
        int coinNum = [self coinChange:@[@2] target:3];
        NSLog(@"coinNum = %d",coinNum);
        
    }
    return self;
}

- (int)coinChange:(NSArray *)array target:(int)target{
    
    int iRet = 0;
    int cur = 0;
    int curIndex = 0;
    
    //需要先将array降序排列
    while (cur < target && curIndex < array.count) {
        
        int coin = [array[curIndex] intValue];
        
        if ((cur + coin) < target) {
            cur += coin;
            iRet++;
        }
        else if ((cur + coin) == target){
            return ++iRet;
        }
        else{
            curIndex++;
        }
    }
    
    return -1;
    
}

@end
