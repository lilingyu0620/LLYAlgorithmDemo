//
//  Combinations.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/2.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
//
//Example:
//
//Input: n = 4, k = 2
//Output:
//[
// [2,4],
// [3,4],
// [2,3],
// [1,2],
// [1,3],
// [1,4],
// ]


#import "Combinations.h"

@implementation Combinations{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        [self combinations:[NSMutableArray array] n:4 k:3 index:1];
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}


- (void)combinations:(NSMutableArray *)array n:(int)n k:(int)k index:(int)index{
    
    if (array.count == k) {
        [_array addObject:[NSArray arrayWithArray:array]];
        return;
    }
    
    for (int i = index; i <= n; i++) {
        [array addObject:@(i)];
        [self combinations:array n:n k:k index:(i + 1)];
        [array removeLastObject];
    }
    
}

@end
