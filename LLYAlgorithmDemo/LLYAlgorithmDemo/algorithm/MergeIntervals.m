//
//  MergeIntervals.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/21.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given a collection of intervals, merge all overlapping intervals.
//
//Example 1:
//
//Input: [[1,3],[2,6],[8,10],[15,18]]
//Output: [[1,6],[8,10],[15,18]]
//Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
//Example 2:
//
//Input: [[1,4],[4,5]]
//Output: [[1,5]]
//Explanation: Intervals [1,4] and [4,5] are considerred overlapping.


#import "MergeIntervals.h"

@implementation MergeIntervals


- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSMutableArray *array = [self mergeIntervals:@[@[@1,@3],@[@2,@6],@[@8,@10],@[@15,@18]]];
//        NSMutableArray *array = [self mergeIntervals:@[@[@1,@3,@5],@[@2,@6,@8],@[@8,@10,@14],@[@15,@18]]];
        NSMutableArray *array = [self mergeIntervals:@[@[@1,@4],@[@4,@5]]];
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
                NSArray *newArray = [NSArray arrayWithObjects:lastArray.firstObject,tmpArray.lastObject, nil];
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

@end
