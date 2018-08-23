//
//  ContainsDuplicate.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/23.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given an array of integers, find if the array contains any duplicates.
//
//Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
//
//Example 1:
//
//Input: [1,2,3,1]
//Output: true
//Example 2:
//
//Input: [1,2,3,4]
//Output: false
//Example 3:
//
//Input: [1,1,1,3,3,4,3,2,4,2]
//Output: true

#import "ContainsDuplicate.h"

@implementation ContainsDuplicate

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        BOOL contains = [self containsDuplicate:@[@1,@2,@3,@1]];
//        BOOL contains = [self containsDuplicate:@[@1,@2,@3,@4]];
        BOOL contains = [self containsDuplicate:@[@1,@1,@1,@3,@3,@4,@3,@2,@4,@2]];
        NSLog(@"contains = %d",contains);
        
    }
    return self;
}


- (BOOL)containsDuplicate:(NSArray *)array{
    
    int max = [self maxArray:array];
    if (max < array.count) {
        return YES;
    }
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (int i = 0; i <= max; i++) {
        [tmpArray addObject:@(0)];
    }
    
    for (int i = 0; i < array.count; i++) {
        
        if ([tmpArray[[array[i] intValue]] intValue] == 1) {
            return YES;
        }else{
            tmpArray[[array[i] intValue]] = @(1);
        }
    }
    
    return NO;
}

- (int)maxArray:(NSArray *)array{
    
    int max = 0;
    for (int i = 0; i < array.count; i++) {
        max = MAX(max, [array[i] intValue]);
    }
    return max;
}

@end
