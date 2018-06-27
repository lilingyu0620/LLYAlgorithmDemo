//
//  MinimumPathSum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/27.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
//
//Note: You can only move either down or right at any point in time.
//
//Example:
//
//Input:
//[
// [1,3,1],
// [1,5,1],
// [4,2,1]
// ]
//Output: 7
//Explanation: Because the path 1→3→1→1→1 minimizes the sum.

#import "MinimumPathSum.h"

@implementation MinimumPathSum

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *array = @[@[@1,@3,@1],@[@1,@5,@1],@[@4,@2,@1]];
        int min = [self minimumPathSum:array row:2 clo:2];
        NSLog(@"min = %d",min);
    }
    return self;
}

- (int)minimumPathSum:(NSArray *)array row:(int)row clo:(int)clo{
    
    if (row == 0 && clo == 0) {
        return [array[row][clo] intValue];
    }
    
    if (row == 0){
        return [array[row][clo] intValue] + [self minimumPathSum:array row:row clo:(clo - 1)];
    }
    
    if (clo == 0) {
        return [array[row][clo] intValue] + [self minimumPathSum:array row:(row - 1) clo:clo];
    }
    
    return [array[row][clo] intValue] + MIN([self minimumPathSum:array row:(row - 1) clo:clo], [self minimumPathSum:array row:row clo:(clo - 1)]);
}

@end
