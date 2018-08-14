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
        
        result = [self buySellStock2:@[@7,@1,@5,@3,@6,@4]];
        NSLog(@"result = %d",result);
        
        result = [self buySellStock3:@[@3,@3,@5,@0,@0,@3,@1,@4]];
        NSLog(@"result = %d",result);
        
        result = [self buySellStock4:@[@3,@2,@6,@5,@0,@3] k:2];
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

- (int)buySellStock2:(NSArray *)array{
    
    int total = 0;
    for (int i = 1; i < array.count; i++) {
        if ([array[i] intValue] > [array[i-1] intValue]) {
            total += [array[i] intValue] - [array[i-1] intValue];
        }
    }
    return total;
}

- (int)buySellStock3:(NSArray *)array{
    
    NSInteger buy1 = NSIntegerMin ,sell1 = 0;
    NSInteger buy2 = NSIntegerMin,sell2 = 0;
    
    for (int i = 0; i < array.count; i++) {
        
        buy1 = MAX(buy1, -[array[i] intValue]);
        sell1 = MAX(sell1, [array[i] intValue] + buy1);
        buy2 = MAX(buy2, sell1 - [array[i] intValue]);
        sell2 = MAX(sell2, [array[i] intValue] + buy2);
        
    }
    
    return sell2;
}

- (int)buySellStock4:(NSArray *)array k:(int)k{
    
    NSMutableArray *retArray = [NSMutableArray array];
    for (int i = 1; i < array.count; i++) {
        [retArray addObject:@([array[i] intValue] - [array[i-1] intValue])];
    }
    
    
    int ret = 0;
//    for (int i = 0; i < retArray.count; i++) {
//        for (int j = 0; j+1 < retArray.count-i; j++) {
//            if ([retArray[j] intValue] < [retArray[j+1] intValue]) {
//                id tmp = retArray[j];
//                retArray[j] = retArray[j+1];
//                retArray[j+1] = tmp;
//            }
//        }
//    }
    
    [retArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 intValue] > [obj2 intValue]) {
            return NSOrderedAscending;
        }
        else if ([obj1 intValue] < [obj2 intValue]){
            return NSOrderedDescending;
        }
        else{
            return NSOrderedSame;
        }
    }];
    
    for (int i = 0; i < k; i++) {
        ret = MAX(ret, ret + [retArray[i] intValue]);
    }
    
    return ret;
}

@end
