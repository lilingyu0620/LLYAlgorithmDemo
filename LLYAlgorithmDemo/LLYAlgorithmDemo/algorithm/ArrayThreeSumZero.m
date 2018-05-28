//
//  ArrayThreeSumZero.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/28.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ArrayThreeSumZero.h"

//
//Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note:
//
//The solution set must not contain duplicate triplets.
//
//Example:
//
//Given array nums = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
// [-1, 0, 1],
// [-1, -1, 2]
// ]

@implementation ArrayThreeSumZero

- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSMutableArray *array = [self sumArrayWithArray:@[@-1,@0,@1,@2,@-1,@-4]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}


- (NSMutableArray *)sumArrayWithArray:(NSArray *)oriArray{
    
    NSMutableArray *retArray = [NSMutableArray array];
    int j = 0,k = 0;
    for (int i = 0; i < oriArray.count - 2; i++) {
        j = i + 1;
        k = i + 2;
        while (k < oriArray.count) {
            if ([oriArray[i] intValue] + [oriArray[j] intValue] + [oriArray[k] intValue] == 0) {
                [retArray addObject:@[oriArray[i],oriArray[j],oriArray[k]]];
            }
            j++;
            k++;
        }
    }
    return retArray;
}


@end
