//
//  TwoSum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/3/22.
//  Copyright © 2018年 lly. All rights reserved.
//

/*
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 */

#import "TwoSum.h"

@implementation TwoSum

- (instancetype)init{
    self = [super init];
    if (self) {
        [self twoSum:@[@2,@7,@11,@15] len:4 target:9];
    }
    return self;
}


- (NSMutableArray *)twoSum:(NSArray *)array len:(NSInteger)len target:(NSInteger)target{
    
    NSMutableArray *bArray = [NSMutableArray array];
    for (int i = 0; i < len; i++) {
        for (int j = i+1; j < len; j++) {
            int x = [array[i] intValue],y = [array[j] intValue];
            if (x + y == target) {
                bArray[0] = @(i);
                bArray[1] = @(j);
                NSLog(@"index1 = %d,index2 = %d",i,j);
                return bArray;
            }
        }
    }
    return nil;
}

@end
