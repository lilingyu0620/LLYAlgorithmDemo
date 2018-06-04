//
//  SearchforaRange.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/4.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].
//
//Example 1:
//
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//Example 2:
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]

#import "SearchforaRange.h"

@implementation SearchforaRange


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        NSArray *array = [self searchforaRange:@[@5,@7,@7,@8,@8,@10] target:6];
        NSLog(@"array = %@",array);
    }
    
    return self;
}

- (NSArray *)searchforaRange:(NSArray *)array target:(int)target{
    
    NSArray *retArray = @[@-1,@-1];
    int min = 0,max = array.count - 1;
    int mid = (min+max)/2;
    
    while (min <= max) {
        
        if ([array[mid] intValue] > target) {
            max = mid - 1;
            mid = (max+min)/2;
        }
        else if ([array[mid] intValue] < target){
            min = mid + 1;
            mid = (max+min)/2;
        }
        else{
            
            if ([array[mid + 1] intValue] == target) {
                return @[@(mid),@(mid + 1)];
            }
            else if ([array[mid - 1] intValue] == target){
                return @[@(mid - 1),@(mid)];
            }
            
        }
    }
    return retArray;
}

@end
