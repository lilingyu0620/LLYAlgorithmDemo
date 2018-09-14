//
//  MissingNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/14.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
//
//Example 1:
//
//Input: [3,0,1]
//Output: 2
//Example 2:
//
//Input: [9,6,4,2,3,5,7,0,1]
//Output: 8


#import "MissingNumber.h"

@implementation MissingNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int missNum = [self missingNumber:@[@3,@0,@1]];
        int missNum = [self missingNumber:@[@9,@6,@4,@2,@3,@5,@7,@0,@1]];
        NSLog(@"missNum = %d",missNum);
    }
    return self;
}

- (int)missingNumber:(NSArray *)array{
    
    int max = [self maxNumArray:array];
    int min = [self minNumArray:array];
    
    int missNum = 0;
    
    for (int i = min; i <= max; i++) {
        missNum ^= i;
    }
    
    for (int i = 0; i < array.count; i++) {
        missNum ^= [array[i] intValue];
    }
    
    return missNum;
}

- (int)maxNumArray:(NSArray *)array{
    
    NSInteger max = NSIntegerMin;
    for (int i = 0; i < array.count; i++) {
        max = MAX(max, [array[i] intValue]);
    }
    return max;
}

- (int)minNumArray:(NSArray *)array{
    
    NSInteger min = NSIntegerMax;
    for (int i = 0; i < array.count; i++) {
        min = MIN(min, [array[i] intValue]);
    }
    return min;

}



@end
