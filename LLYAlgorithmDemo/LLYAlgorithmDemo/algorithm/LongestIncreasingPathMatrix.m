//
//  LongestIncreasingPathMatrix.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/12/17.
//  Copyright © 2018 lly. All rights reserved.
//
//
//Given an integer matrix, find the length of the longest increasing path.
//
//From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).
//
//Example 1:
//
//Input: nums =
//[
// [9,9,4],
// [6,6,8],
// [2,1,1]
// ]
//Output: 4
//Explanation: The longest increasing path is [1, 2, 6, 9].
//Example 2:
//
//Input: nums =
//[
// [3,4,5],
// [3,2,6],
// [2,2,1]
// ]
//Output: 4
//Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.

#import "LongestIncreasingPathMatrix.h"

@implementation LongestIncreasingPathMatrix{
    NSArray *_indexDirectionArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _indexDirectionArray = @[@[@0,@1],@[@1,@0],@[@0,@-1],@[@-1,@0]];
        NSArray *array = @[@[@9,@9,@4],@[@6,@6,@8],@[@2,@1,@1]];
        
        NSInteger length = [self longestIncreasingPathMatrix:array];
        NSLog(@"length = %ld",(long)length);
        
    }
    return self;
}

- (NSInteger)longestIncreasingPathMatrix:(NSArray *)matrix{
    
    NSMutableArray *dp = [NSMutableArray arrayWithArray:@[[NSMutableArray arrayWithArray:@[@0,@0,@0]],[NSMutableArray arrayWithArray:@[@0,@0,@0]],[NSMutableArray arrayWithArray:@[@0,@0,@0]]]];

    NSInteger max = 1;
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            NSInteger len = [self dfs:matrix index1:i index2:j m:3 n:3 dp:dp];
            max = MAX(len, max);
        }
    }
    
    return max;
    
    
}

- (NSInteger)dfs:(NSArray *)matrix index1:(NSInteger)x index2:(NSInteger)y m:(NSInteger)m n:(NSInteger)n dp:(NSMutableArray *)dp{
    if ([dp[x][y] integerValue] != 0) {
        return [dp[x][y] integerValue];
    }
    
    NSInteger max = 1;
    
    for (NSArray *direcArray in _indexDirectionArray) {
        
        NSInteger idx1 = [direcArray[0] integerValue] + x;
        NSInteger idx2 = [direcArray[1] integerValue] + y;
        
        if (idx1 < 0 || idx1 >= m || idx2 < 0 || idx2 >= n || [matrix[x][y] integerValue] <= [matrix[idx1][idx2] integerValue]) {
            continue;
        }
        //重点！！！
        NSInteger len = 1 + [self dfs:matrix index1:idx1 index2:idx2 m:m n:n dp:dp];
        max = MAX(max, len);
    }
    
    dp[x][y] = @(max);
    
    return max;
}

@end
