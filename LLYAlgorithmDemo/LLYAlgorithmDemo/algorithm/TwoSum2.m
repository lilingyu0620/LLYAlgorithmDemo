//
//  TwoSum2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/10.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
//
//The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
//
//Note:
//
//Your returned answers (both index1 and index2) are not zero-based.
//You may assume that each input would have exactly one solution and you may not use the same element twice.
//Example:
//
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
//Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.


#import "TwoSum2.h"

@implementation TwoSum2

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *array = [self twoSum2:@[@2,@7,@11,@15] target:13];
        NSLog(@"_array = %@",array);
        
    }
    return self;
}

- (NSArray *)twoSum2:(NSArray *)array target:(int)target{
    
    for (int i = 0; i < array.count && [array[i] intValue] <= target; i++) {
        
        for (int j = i+1; j < array.count && [array[j] intValue] <= target; j++) {
            
            if ([array[i] intValue] + [array[j] intValue] == target) {
                return @[@(i+1),@(j+1)];
            }
            
        }
    }
    
    return nil;
}


@end
