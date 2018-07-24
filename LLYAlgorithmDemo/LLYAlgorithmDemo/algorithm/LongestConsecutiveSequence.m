//
//  LongestConsecutiveSequence.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/24.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
//
//Your algorithm should run in O(n) complexity.
//
//Example:
//
//Input: [100, 4, 200, 1, 3, 2]
//Output: 4
//Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

#import "LongestConsecutiveSequence.h"

@implementation LongestConsecutiveSequence

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int length = [self longestConsecutiveSequence:@[@100, @4, @200, @1, @3, @2,@128,@5,@99,@7,@6]];
        NSLog(@"length = %d",length);
        
    }
    return self;
}

- (int)longestConsecutiveSequence:(NSArray *)array{
    
    int maxIndex = -1;
    
    for (int i = 0; i < array.count; i++) {
        if (maxIndex < [array[i] intValue]) {
            maxIndex = [array[i] intValue];
        }
    }
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:maxIndex];
    
    for (int i = 0; i <= maxIndex; i++) {
        [tmpArray addObject:@(0)];
    }
    
    for (int i = 0; i < array.count; i++) {
        tmpArray[[array[i] intValue]] = @(1);
    }
    
    int length = 0;
    int curLength = 0;
    for (int i = 0; i < tmpArray.count; i++) {
        if ([tmpArray[i] intValue] == 1) {
            curLength++;
            length = MAX(length, curLength);
        }
        else{
            curLength = 0;
        }
    }
    
    return length;
}


@end
