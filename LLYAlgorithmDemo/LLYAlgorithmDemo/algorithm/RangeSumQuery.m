//
//  RangeSumQuery.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/26.
//  Copyright © 2018年 lly. All rights reserved.
//

//一维
//Given nums = [-2, 0, 3, -5, 2, -1]
//
//sumRange(0, 2) -> 1
//sumRange(2, 5) -> -1
//sumRange(0, 5) -> -3

//二维
//Given matrix = [
//                [3, 0, 1, 4, 2],
//                [5, 6, 3, 2, 1],
//                [1, 2, 0, 1, 5],
//                [4, 1, 0, 1, 7],
//                [1, 0, 3, 0, 5]
//                ]
//
//sumRegion(2, 1, 4, 3) -> 8
//sumRegion(1, 1, 2, 2) -> 11
//sumRegion(1, 2, 2, 4) -> 12

#import "RangeSumQuery.h"

@implementation RangeSumQuery{
    NSMutableArray *sumArray;
    NSMutableArray *dpArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //一维
        sumArray = [NSMutableArray array];
        
        NSArray *array = @[@-2,@0,@3,@-5,@2,@-1];
        
        [sumArray addObject:array[0]];
        
        for (int i = 1;i < array.count ; i++) {
            int sum = [array[i] intValue] + [sumArray[i-1] intValue];
            [sumArray addObject:@(sum)];
        }
        
        int sum = [self rangeSumQueryWithindex1:0 index2:5];
        NSLog(@"sum = %ld",(unsigned long)sum);
        
        //二维
        dpArray = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@3,@3,@4,@8,@10]],[NSMutableArray arrayWithArray:@[@8]],[NSMutableArray arrayWithArray:@[@9]],[NSMutableArray arrayWithArray:@[@13]],[NSMutableArray arrayWithArray:@[@14]], nil];
        
        NSArray *matrix = @[@[@3,@0,@1,@4,@2],@[@5,@6,@3,@2,@1],@[@1,@2,@0,@1,@5],@[@4,@1,@0,@1,@7],@[@1,@0,@3,@0,@5]];
        
        for (int i = 1; i < matrix.count; i++) {
            
            NSArray *tmpArray = matrix[i];
            NSMutableArray *dpRow = dpArray[i];
            NSMutableArray *dpCol = dpArray[i-1];
            
            for (int j = 1; j < tmpArray.count; j++) {
                int sum = [tmpArray[j] intValue] + [dpRow[j-1] intValue] + [dpCol[j] intValue] - [dpCol[j-1] intValue];
                [dpRow addObject:@(sum)];
            }
            
        }
        
        NSLog(@"dpArray = %@",dpArray);
        
        int mSum = [self RangeSumQuery2DWithRow1:1 Col1:2 Row2:2 Col2:4];
        NSLog(@"mSum = %d",mSum);
        
        
    }
    return self;
}

- (int)rangeSumQueryWithindex1:(int)idx1 index2:(int)idx2{
    
    if (idx1 == 0) {
        return [sumArray[idx2] intValue];
    }
    
    int sum2 = [sumArray[idx2] intValue];
    int sum1 = [sumArray[idx1-1] intValue];
    
    return  sum2-sum1;
    
}

//求正方形的面积 分4种情况
- (int)RangeSumQuery2DWithRow1:(int)row1 Col1:(int)col1 Row2:(int)row2 Col2:(int)col2{
    
    NSArray *row2Array = dpArray[row2];
    
    if (row1 == 0 && col1 == 0) {
        return [row2Array[col2] intValue];
    }
    else if (row1 == 0) {
        
        NSArray *row1Array = dpArray[row1];

        int sum2 = [row2Array[col2] intValue];
        int sum1 = [row1Array[col1-1] intValue];
        
        return sum2-sum1;
        
    }else if (col1 == 0) {
        
        NSArray *row1Array = dpArray[row1-1];

        int sum2 = [row2Array[col2] intValue];
        int sum1 = [row1Array[col1] intValue];
        
        return sum2-sum1;
        
    }else{
        
        NSArray *row1Array = dpArray[row1-1];
        NSArray *col1Array = dpArray[row2];

        int sum2 = [row2Array[col2] intValue];
        
        int sum11 = [row1Array[col2] intValue];
        int sum1111 = [col1Array[col1-1] intValue];
        int sum1 = (sum11 + sum1111 - [row1Array[col1-1] intValue]);
        
        return sum2-sum1;

    }
   
}

@end
