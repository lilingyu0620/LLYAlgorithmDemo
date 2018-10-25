//
//  SmallerNumbers.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/10/23.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//You are given an integer array nums and you have to return a new counts array. The counts array has the property where counts[i] is the number of smaller elements to the right of nums[i].
//
//Example:
//
//Input: [5,2,6,1]
//Output: [2,1,1,0]
//Explanation:
//To the right of 5 there are 2 smaller elements (2 and 1).
//To the right of 2 there is only 1 smaller element (1).
//To the right of 6 there is 1 smaller element (1).
//To the right of 1 there is 0 smaller element.

#import "SmallerNumbers.h"

@implementation SmallerNumbers

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *array = [self smallerNumbers:@[@5,@2,@6,@1]];
        NSArray *array = [self smallerNumbers2:@[@5,@2,@6,@1]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)smallerNumbers:(NSArray *)array{
    
    NSMutableArray *tArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        
        int curNum = [array[i] intValue];
        int smallNum = 0;
        for (int j = i; j < array.count; j++) {
            int nextNum = [array[j] intValue];
            if (nextNum < curNum) {
                smallNum++;
            }
        }
        
        [tArray addObject:@(smallNum)];
    }
    
    return [NSArray arrayWithArray:tArray];
    
}


- (NSArray *)smallerNumbers2:(NSArray *)array{
    
    NSMutableArray *tArray = [NSMutableArray array];
    
    int curNum = [array[0] intValue];
    int smallNum = 0;

    for (int i = 1; i < array.count; i++) {
        int nextNum = [array[i] intValue];
        if (nextNum < curNum) {
            smallNum++;
        }
    }
    
    [tArray addObject:@(smallNum)];
    
    for (int i = 1; i < array.count; i++) {
        int nextNum = [array[i] intValue];
        if (nextNum < curNum) {
            [tArray addObject:@([tArray[i-1] intValue] - 1)];
        }
        else{
            [tArray addObject:@([tArray[i-1] intValue])];
        }
    }

    
    return [NSArray arrayWithArray:tArray];

}

@end
