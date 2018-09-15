//
//  PerfectSquares.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/15.
//  Copyright © 2018 lly. All rights reserved.
//

//Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
//
//Example 1:
//
//Input: n = 12
//Output: 3
//Explanation: 12 = 4 + 4 + 4.
//Example 2:
//
//Input: n = 13
//Output: 2
//Explanation: 13 = 4 + 9.

#import "PerfectSquares.h"

@implementation PerfectSquares{
    NSMutableArray *_sumArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _sumArray = [NSMutableArray array];
        int count = [self perfectSquares:13];
        NSLog(@"count = %d",count);
        
    }
    return self;
}

- (int)perfectSquares:(int)num{
    
    NSArray *array = [self squares:num];
    
    [self combinationSum:array tmpArray:[NSMutableArray array] target:num index:0];
    
    NSInteger count = NSIntegerMax;
    for (int i = 0; i < _sumArray.count; i++) {
        count = MIN(count, ((NSArray *)_sumArray[i]).count);
    }
    return count;
    
}

- (void)combinationSum:(NSArray *)sArray tmpArray:(NSMutableArray *)tmpArray target:(int)target index:(int)index{
    
    if (target == 0) {
        [_sumArray addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }
    
    for (int i = index; i < sArray.count && target >= [sArray[i] intValue]; i++) {
    
        [tmpArray addObject:sArray[i]];
        [self combinationSum:sArray tmpArray:tmpArray target:(target - [sArray[i] intValue]) index:i];
        [tmpArray removeLastObject];
    }
    
}

- (NSArray *)squares:(int)num{
    
    NSMutableArray *array = [NSMutableArray array];

    for (int i = 1; i <= num; i++) {
        
        if ([self isSquares:i]) {
            [array addObject:@(i)];
        }
        
    }
    
    return array;
}

- (BOOL)isSquares:(int)num{
    
    if (num == 1) {
        return YES;
    }
    
    for (int i = 1; i <= num/2; i++) {
        
        if (num % i == 0 && i == num / i) {
            return YES;
        }
        
    }
    
    return NO;
}

@end
