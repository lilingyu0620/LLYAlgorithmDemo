//
//  SpiralMatrix.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/19.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
//Example 1:
//
//Input:
//[
// [ 1, 2, 3 ],
// [ 4, 5, 6 ],
// [ 7, 8, 9 ]
// ]
//Output: [1,2,3,6,9,8,7,4,5]
//Example 2:
//
//Input:
//[
// [1, 2, 3, 4],
// [5, 6, 7, 8],
// [9,10,11,12]
// ]
//Output: [1,2,3,4,8,12,11,10,9,5,6,7]

#import "SpiralMatrix.h"

@implementation SpiralMatrix

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSMutableArray *array = [self spiralMatrix:@[@[@1,@2,@3,@4],@[@5,@6,@7,@8],@[@9,@10,@11,@12]]];
        NSMutableArray *array = [self spiralMatrix:@[@[@1,@2,@3],@[@5,@6,@7],@[@9,@10,@11]]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}


- (NSMutableArray *)spiralMatrix:(NSArray *)array{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    int row = array.count;
    int cloumn = [(NSArray *)array.firstObject count];
    
    int rowStart = 0,rowEnd = row,cloStart = 0,cloEnd = cloumn;
    
    while (rowStart <= rowEnd) {
        
        NSArray *rowStartArray = array[rowStart];
        for (int i = cloStart; i < cloEnd; i++) {
            [retArray addObject:rowStartArray[i]];
        }
        
        //如果只有最后一行了退回循环
        if (abs(rowStart - rowEnd) == 1) {
            break;
        }
        
        for (int i = rowStart + 1; i < rowEnd - 1; i++) {
            NSArray *tmpArray = array[i];
            [retArray addObject:tmpArray[cloEnd -1]];
        }
        
        NSArray *rowEndArray = array[rowEnd - 1];
        for (int i = cloEnd - 1; i >= cloStart; i--) {
            [retArray addObject:rowEndArray[i]];
        }
        
        for (int i = rowEnd - 2; i > rowStart; i--) {
            NSArray *tmpArray = array[i];
            [retArray addObject:tmpArray[cloStart]];
        }
        
        rowStart++;
        rowEnd--;

        cloStart++;
        cloEnd--;
    }
    return retArray;
}



@end
