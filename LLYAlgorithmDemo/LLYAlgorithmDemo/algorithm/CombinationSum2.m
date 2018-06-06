//
//  CombinationSum2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/5.
//  Copyright © 2018年 lly. All rights reserved.
//
//
//
//Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//Each number in candidates may only be used once in the combination.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [10,1,2,7,6,1,5], target = 8,
//A solution set is:
//[
// [1, 7],
// [1, 2, 5],
// [2, 6],
// [1, 1, 6]
// ]
//Example 2:
//
//Input: candidates = [2,5,2,1,2], target = 5,
//A solution set is:
//[
// [1,2,2],
// [5]
// ]

#import "CombinationSum2.h"

@implementation CombinationSum2{
    NSMutableArray *_array;
}


- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        
        [self combinationSum2:@[@1,@1,@2,@5,@6,@7,@10] target:8 index:0 tmpArray:[NSMutableArray array]];
        
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}


- (void)combinationSum2:(NSArray *)array target:(int)target index:(int)index tmpArray:(NSMutableArray *)tmpArray{
    
    if (target == 0) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }
    
    for (int i = index; i < array.count && target >= [array[i] intValue]; i++) {
        if (i > index && [array[i] intValue] == [array[i-1] intValue]) {
            continue;
        }
        [tmpArray addObject:array[i]];
        [self combinationSum2:array target:target - [array[i] intValue]  index:i+1 tmpArray:tmpArray];
        [tmpArray removeLastObject];
    }
    
    
}


@end
