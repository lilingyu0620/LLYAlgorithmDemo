//
//  CombinationSum3.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/23.
//  Copyright © 2018年 lly. All rights reserved.
//

//Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.
//
//Note:
//
//All numbers will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: k = 3, n = 7
//Output: [[1,2,4]]
//Example 2:
//
//Input: k = 3, n = 9
//Output: [[1,2,6], [1,3,5], [2,3,4]]

#import "CombinationSum3.h"

@implementation CombinationSum3{
    NSMutableArray *_array;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        [self combinationSum3:@[@1,@2,@3,@4,@5,@6,@7,@8,@9] tmpArray:[NSMutableArray array] target:9 k:3 index:0];
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (void)combinationSum3:(NSArray *)array tmpArray:(NSMutableArray *)tmpArray target:(int)target k:(int)k index:(int)index{
    
    if (target == 0 && tmpArray.count == k) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
    }
    
    for (int i = index; i < array.count &&  target >= [array[i] intValue]; i++) {
        [tmpArray addObject:array[i]];
        [self combinationSum3:array tmpArray:tmpArray target:target-[array[i] intValue] k:k index:i+1];
        [tmpArray removeLastObject];
    }
    
}

@end
