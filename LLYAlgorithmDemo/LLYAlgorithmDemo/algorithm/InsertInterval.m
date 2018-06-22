//
//  InsertInterval.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/22.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
//
//You may assume that the intervals were initially sorted according to their start times.
//
//Example 1:
//
//Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
//Output: [[1,5],[6,9]]
//Example 2:
//
//Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
//Output: [[1,2],[3,10],[12,16]]
//Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].


#import "InsertInterval.h"

@implementation InsertInterval


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSMutableArray *array = [self insertInterval:@[@[@1,@2],@[@3,@5],@[@6,@7],@[@8,@10],@[@12,@16]] targetArray:[NSMutableArray arrayWithArray:@[@4,@8]]];
//        NSMutableArray *array = [self insertInterval:@[@[@1,@3],@[@6,@9]] targetArray:[NSMutableArray arrayWithArray:@[@2,@5]]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}


- (NSMutableArray *)mergeIntervals:(NSArray *)array{
    
    NSMutableArray *retArray = [NSMutableArray array];
    for (NSArray *tmpArray in array) {
        bool isMerge = NO;
        NSArray *lastArray = retArray.lastObject;
        int lastNum = [lastArray.lastObject intValue];
        for (int i = 0; i < tmpArray.count - 1; i++) {
            int tmpNum = [tmpArray[i] intValue];
            if (lastNum >= tmpNum) {
                [retArray removeLastObject];
                NSArray *newArray = [NSArray arrayWithObjects:lastArray.firstObject,MAX(lastArray.lastObject, tmpArray.lastObject), nil];
                [retArray addObject:newArray];
                isMerge = YES;
            }
        }
        
        if (!isMerge) {
            [retArray addObject:tmpArray];
        }
    }
    return retArray;
}

- (NSMutableArray *)insertInterval:(NSArray *)array targetArray:(NSMutableArray *)targetArray{
    
    NSMutableArray *retArray = [NSMutableArray arrayWithArray:array];

    for (int i = 0;i < array.count; i++) {
        
        NSArray *tmpArray = array[i];
        
        NSMutableArray *newArray = [NSMutableArray arrayWithArray:tmpArray];

        if ([tmpArray.firstObject intValue] > [targetArray.firstObject intValue]) {
            newArray[0] = targetArray.firstObject;
            [targetArray removeObjectAtIndex:0];
        }
        if ([tmpArray.lastObject intValue] < [targetArray.lastObject intValue] && [tmpArray.lastObject intValue] > [targetArray.firstObject intValue]){
            newArray[tmpArray.count - 1] = targetArray.lastObject;
            [targetArray removeAllObjects];
        }
        retArray[i] = newArray;
        
        if (targetArray.count == 0) {
            break;
        }
    }
    
    NSLog(@"array = %@",retArray);
    
    retArray = [self mergeIntervals:retArray];
    
    NSLog(@"array = %@",retArray);
    
    return retArray;
}


@end
