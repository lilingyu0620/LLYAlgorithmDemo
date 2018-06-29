//
//  SetMatrixZeroes.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/28.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//
//Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.
//
//Example 1:
//
//Input:
//[
// [1,1,1],
// [1,0,1],
// [1,1,1]
// ]
//Output:
//[
// [1,0,1],
// [0,0,0],
// [1,0,1]
// ]
//Example 2:
//
//Input:
//[
// [0,1,2,0],
// [3,4,5,2],
// [1,3,1,5]
// ]
//Output:
//[
// [0,0,0,0],
// [0,4,5,0],
// [0,3,1,0]
// ]
//Follow up:
//
//A straight forward solution using O(mn) space is probably a bad idea.
//A simple improvement uses O(m + n) space, but still not the best solution.
//Could you devise a constant space solution?

#import "SetMatrixZeroes.h"

@implementation SetMatrixZeroes{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@0,@1,@1,@0]],[NSMutableArray arrayWithArray:@[@1,@1,@1,@1]],[NSMutableArray arrayWithArray:@[@1,@1,@1,@1]], nil];
//        NSMutableArray *tmpArray = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@0,@1,@1,@0]],[NSMutableArray arrayWithArray:@[@1,@1,@1,@1]],[NSMutableArray arrayWithArray:@[@1,@1,@1,@1]], nil];
//        [self setMatrixZeroes:tmpArray];
//        NSLog(@"_array = %@",_array);
        
        [self setMatrixZeroes2:_array];
        NSLog(@"_array = %@",_array);
    }
    return self;
}

- (void)setMatrixZeroes2:(NSMutableArray *)array{
    
    int clo0 = 1;
    
    NSMutableArray *clo0Array = array.firstObject;
    
    for (int i = 0; i < array.count; i++) {
        NSMutableArray *tmpArray = array[i];
        if ([tmpArray[0] intValue] == 0) {
            clo0 = 0;
        }
        for (int j = 1; j < tmpArray.count; j++) {
            if ([tmpArray[j] intValue] == 0) {
                tmpArray[0] = @0;
                clo0Array[j] = @0;
            }
        }
    }
    
    for (int i = array.count - 1; i >= 0; i--) {
        NSMutableArray *tmpArray = array[i];
        for (int j = tmpArray.count - 1; j >= 0; j--) {
            if ([tmpArray[0] intValue] == 0 || [clo0Array[j] intValue] == 0) {
                tmpArray[j] = @0;
            }
        }
        if (clo0 == 0) {
            tmpArray[0] = @0;
        }
    }
    
}

- (void)setMatrixZeroes:(NSMutableArray *)array{
    
    NSMutableArray *cloArray = [NSMutableArray array];
    NSMutableArray *rowArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        NSMutableArray *tmpArray = array[i];
        for (int j = 0; j < tmpArray.count; j++) {
            if ([tmpArray[j] intValue] == 0) {
                
                if (![rowArray containsObject:@(i)]) {
                    [self setRowToZero:_array row:i];
                    [rowArray addObject:@(i)];
                }
                
                if (![cloArray containsObject:@(j)]) {
                    [self setCloToZero:_array clo:j];
                    [cloArray addObject:@(j)];
                }
    
            }
        }
    }
}

- (void)setRowToZero:(NSMutableArray *)array row:(int)row{
    
    NSMutableArray *tmpArray = array[row];
    for (int i = 0; i < tmpArray.count; i++) {
        tmpArray[i] = @0;
    }
}

- (void)setCloToZero:(NSMutableArray *)array clo:(int)clo{
    
    for (int i = 0; i < array.count; i++) {
        NSMutableArray *tmpArray = array[i];
        tmpArray[clo] = @0;
    }
}

@end
