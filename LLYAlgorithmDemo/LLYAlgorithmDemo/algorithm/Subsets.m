//
//  Subsets.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/3.
//  Copyright © 2018 lly. All rights reserved.
//


//Given a set of distinct integers, nums, return all possible subsets (the power set).
//
//Note: The solution set must not contain duplicate subsets.
//
//Example:
//
//Input: nums = [1,2,3]
//Output:
//[
// [3],
// [1],
// [2],
// [1,2,3],
// [1,3],
// [2,3],
// [1,2],
// []
// ]


#import "Subsets.h"

@implementation Subsets{
    NSArray *_oriArray;
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _oriArray =@[@1,@2,@3,@4];
        _array = [NSMutableArray array];
        
        [self subsets:[NSMutableArray array] index:0];
        NSLog(@"_array = %@",_array);
    }
    return self;
}


- (void)subsets:(NSMutableArray *)array index:(int)index{
    
    [_array addObject:[NSArray arrayWithArray:array]];
    
    for (int i = index; i < _oriArray.count; i++) {
        [array addObject:_oriArray[i]];
        [self subsets:array index:(i + 1)];
        [array removeLastObject];
    }
}

@end
