//
//  JumpGame.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/20.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Determine if you are able to reach the last index.
//
//Example 1:
//
//Input: [2,3,1,1,4]
//Output: true
//Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Example 2:
//
//Input: [3,2,1,0,4]
//Output: false
//Explanation: You will always arrive at index 3 no matter what. Its maximum
//jump length is 0, which makes it impossible to reach the last index.


#import "JumpGame.h"

@implementation JumpGame

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        BOOL reach = [self jumpGame:@[@3,@1,@9,@1,@1]];
        NSLog(@"reach = %d",reach);
    }
    return self;
}

- (BOOL)jumpGame:(NSArray *)array{
    
    int length = array.count;
    int index = 1;
    while (index < length - 1) {
        int elm = [array[index] intValue];
        
        if (elm == 0 && index < length - 1) {
            return NO;
        }
        
        index += elm;
    }
    
    if (index >= length - 1) {
        return YES;
    }
    
    return NO;
    
}

@end
