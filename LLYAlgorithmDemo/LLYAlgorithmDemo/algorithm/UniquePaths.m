//
//  UniquePaths.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/26.
//  Copyright © 2018年 lly. All rights reserved.
//


//
//A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//How many possible unique paths are there?
//
//
//Above is a 7 x 3 grid. How many possible unique paths are there?
//
//Note: m and n will be at most 100.
//
//Example 1:
//
//Input: m = 3, n = 2
//Output: 3
//Explanation:
//From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
//1. Right -> Right -> Down
//2. Right -> Down -> Right
//3. Down -> Right -> Right
//Example 2:
//
//Input: m = 7, n = 3
//Output: 28


//我们可以把棋盘的左下角看做二维坐标的原点(0,0)，把棋盘的右上角看做二维坐标(n,n)(坐标系的单位长度为小方格的变长)
//用f(i,j)表示移动到坐标f(i,j)的走法总数，其中0=<i,j<=n，我们即求f(n,n)这样我们就可以递归的定义子问题
//f(n,n)=f(n-1,n)+f(n,n-1).
//于是状态f(i,j)的状态转移方程为：
//f(i,j)=f(i-1,j)+f(i,j-1)   if i,j>0
//f(i,j)=f(i,j-1)            if i=0
//f(i,j)=f(i-1,j)            if j=0
//
//初始情况就为：f(0,0)=0, f(0,1)=1, f(1,0)=1

#define ROW 3
#define CLO 2

#import "UniquePaths.h"

@implementation UniquePaths

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"pathNUM = %d",[self uniquePaths:6 clo:2]);
    }
    return self;
}


- (int)uniquePaths:(int)row clo:(int)clo{
    
    if (row == 0 && clo == 0) {
        return 0;
    }
    if (row == 0 && clo == 1) {
        return 1;
    }
    if (row == 1 && clo == 0) {
        return 1;
    }
    if (row == 0) {
        return [self uniquePaths:row clo:(clo - 1)];
    }
    if (clo == 0) {
        return [self uniquePaths:(row - 1) clo:clo];
    }
    return [self uniquePaths:(row - 1) clo:clo] + [self uniquePaths:row clo:(clo - 1)];
}

//- (void)uniquePaths:(NSMutableArray *)array row:(int)row clo:(int)clo{
//
//    if (row == ROW && clo == CLO) {
//        [_resArray addObject:array];
//        return;
//    }
//
//    if (row < ROW) {
//        [array addObject:@"Right"];
//        [self uniquePaths:array row:(row + 1) clo:clo];
//    }
//
//    if (clo < CLO){
//        [array addObject:@"Down"];
//        [self uniquePaths:array row:row clo:(clo + 1)];
//    }
//
//}

@end
