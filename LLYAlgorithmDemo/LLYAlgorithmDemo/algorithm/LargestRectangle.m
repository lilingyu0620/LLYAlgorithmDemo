//
//  LargestRectangle.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/5.
//  Copyright © 2018年 lly. All rights reserved.
//
//
//Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
//
//
//Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
//
//
//
//
//The largest rectangle is shown in the shaded area, which has area = 10 unit.

#import "LargestRectangle.h"

@implementation LargestRectangle

- (instancetype)init
{
    self = [super init];
    if (self) {
//        int height = [self largestRectangle:@[@2,@1,@5,@6,@2,@3,@0]];
        int height = [self largestRectangle:@[@1,@2,@3,@4,@5,@6,@0]];
        NSLog(@"height = %d",height);
    }
    return self;
}

- (int)largestRectangle:(NSArray *)array{
    
    int ret = 0;
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        while (tmpArray.count > 0 && [array[[tmpArray.lastObject intValue]] intValue] >= [array[i] intValue]) {
            
            int h = [array[[tmpArray.lastObject intValue]] intValue];
            [tmpArray removeLastObject];
            
            int xPadding = tmpArray.count > 0 ? [tmpArray.lastObject intValue] : -1;
            
            if (h * (i - xPadding - 1) > ret) {
                ret = h * (i - xPadding - 1);
            }
        }
        [tmpArray addObject:@(i)];
    }
    
    return ret;
}

@end
