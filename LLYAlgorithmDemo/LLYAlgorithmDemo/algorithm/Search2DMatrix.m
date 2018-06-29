//
//  Search2DMatrix.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/29.
//  Copyright © 2018年 lly. All rights reserved.
//

//Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
//
//Integers in each row are sorted from left to right.
//The first integer of each row is greater than the last integer of the previous row.
//Example 1:
//
//Input:
//matrix = [
//          [1,   3,  5,  7],
//          [10, 11, 16, 20],
//          [23, 30, 34, 50]
//          ]
//target = 3
//Output: true
//Example 2:
//
//Input:
//matrix = [
//          [1,   3,  5,  7],
//          [10, 11, 16, 20],
//          [23, 30, 34, 50]
//          ]
//target = 13
//Output: false



#import "Search2DMatrix.h"

@implementation Search2DMatrix

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        BOOL search = [self search2DMatrix:@[@[@1,@3,@5,@7],@[@10,@11,@16,@20],@[@23,@30,@34,@50]] target:3];
        NSLog(@"search = %d",search);
        
    }
    return self;
}


- (BOOL)search2DMatrix:(NSArray *)array target:(int)target{
    
    int row = [self rowOfArray:array target:target];
    if (row >= 0) {
        return [self binarySearch:array[row] target:target];
    }
    return NO;
    
}

- (int)rowOfArray:(NSArray *)array target:(int)target{
    
    for (int i = 0; i < array.count; i++) {
        NSArray *tmpArray = array[i];
        if (target < [tmpArray[0] intValue]) {
            return i-1;
        }
        else if (target == [tmpArray[0] intValue]){
            return i;
        }
    }
    
    return -1;
}

- (BOOL)binarySearch:(NSArray *)sourceArray target:(int)target{
    
    int min,max,mid;
    
    min = 0;
    max = sourceArray.count - 1;
    
    while (min <= max) {
        
        mid = (max - min)/2 + min;

        int tmp = [sourceArray[mid] intValue];
        if (tmp > target) {
            max = mid - 1;
        }
        else if(tmp < target){
            min = mid + 1;
        }
        else{
            return YES;
        }
    }
    
    return NO;
}

@end
