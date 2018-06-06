//
//  CombinationSum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/4.
//  Copyright © 2018年 lly. All rights reserved.
//
//
//
//Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//The same repeated number may be chosen from candidates unlimited number of times.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [2,3,6,7], target = 7,
//A solution set is:
//[
// [7],
// [2,2,3]
// ]
//Example 2:
//
//Input: candidates = [2,3,5], target = 8,
//A solution set is:
//[
// [2,2,2,2],
// [2,3,3],
// [3,5]
// ]


#import "CombinationSum.h"

@implementation CombinationSum{
    NSMutableArray *_array;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        
        [self combinationSum:@[@2,@3,@6,@7] target:7 index:0 tmpArray:[NSMutableArray array]];
        
        NSLog(@"_array = %@",_array);
    }
    return self;
}


- (void)combinationSum:(NSArray *)array target:(int)target index:(int)index tmpArray:(NSMutableArray *)tmpArray{

    if (0 == target) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }

    for (int i = index; i < array.count && target >= [array[i] intValue]; ++i) {
        [tmpArray addObject:array[i]];
        [self combinationSum:array target:target - [array[i] intValue] index:i tmpArray:tmpArray];
        [tmpArray removeLastObject];
    }
}

@end
