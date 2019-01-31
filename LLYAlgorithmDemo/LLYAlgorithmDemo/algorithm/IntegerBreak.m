//
//  IntegerBreak.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/1/31.
//  Copyright © 2019 lly. All rights reserved.
//

//Given a positive integer n, break it into the sum of at least two positive integers and maximize the product of those integers. Return the maximum product you can get.
//
//Example 1:
//
//Input: 2
//Output: 1
//Explanation: 2 = 1 + 1, 1 × 1 = 1.
//Example 2:
//
//Input: 10
//Output: 36
//Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
//Note: You may assume that n is not less than 2 and not larger than 58.
//


#import "IntegerBreak.h"

@implementation IntegerBreak{
    
    NSMutableArray *_array;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        NSInteger max = [self integerBreak:2];
        NSLog(@"max = %ld",(long)max);
        
    }
    return self;
}

- (NSInteger)integerBreak:(NSInteger)ele{
    
    NSInteger ret = ele;
    
    [self addArray:ele start:1 tmpArray:[NSMutableArray array]];
    
    NSLog(@"array = %@",_array);
    
    for (NSArray *arr in _array) {
        
        NSInteger product = 1;
        
        for (NSNumber *num  in arr) {
            product *= [num integerValue];
        }
        
        ret = MAX(product, ret);
        
    }
    
    return ret;
    
}

- (void)addArray:(NSInteger)sum start:(NSInteger)start tmpArray:(NSMutableArray *)tmpArray{
    
    if (sum <= 0){
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }
    
    for (NSInteger i = start; i <= sum; i++) {
        [tmpArray addObject:@(i)];
        [self addArray:sum-i start:i tmpArray:tmpArray];
        [tmpArray removeLastObject];
    }
    
}


@end
