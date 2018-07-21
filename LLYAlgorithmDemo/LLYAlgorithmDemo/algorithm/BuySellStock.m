//
//  BuySellStock.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/21.
//  Copyright © 2018 lly. All rights reserved.
//


//Say you have an array for which the ith element is the price of a given stock on day i.
//
//If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
//
//Note that you cannot sell a stock before you buy one.
//
//Example 1:
//
//Input: [7,1,5,3,6,4]
//Output: 5
//Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//Not 7-1 = 6, as selling price needs to be larger than buying price.
//Example 2:
//
//Input: [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transaction is done, i.e. max profit = 0.
//


#import "BuySellStock.h"

@implementation BuySellStock

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int result = [self buySellStock:@[@7,@1,@5,@3,@6,@4]];
//        int result = [self buySellStock:@[@7,@6,@4,@3,@2,@1]];
        NSLog(@"result = %d",result);
        
    }
    return self;
}

- (int)buySellStock:(NSArray *)array{
    
    int maxCur =0,maxPre = 0;
    for (int i = 1; i < array.count; i++) {
        maxCur = MAX(0, (maxCur + ([array[i] intValue] - [array[i-1] intValue])));
        maxPre = MAX(maxCur, maxPre);
    }
    return maxPre;
}

@end
