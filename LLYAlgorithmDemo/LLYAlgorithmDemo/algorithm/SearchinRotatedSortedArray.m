//
//  SearchinRotatedSortedArray.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/3.
//  Copyright © 2018年 lly. All rights reserved.
//


//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1

#import "SearchinRotatedSortedArray.h"

@implementation SearchinRotatedSortedArray

- (instancetype)init{
    self = [super init];
    if (self) {
        
        int index = [self searchinRotatedSortedArray:@[@4,@5,@6,@7,@0,@1,@2] target:2];
        NSLog(@"index = %d",index);
        
    }
    return self;
}


- (int)searchinRotatedSortedArray:(NSArray *)array target:(int)target{
    
    int iRet = -1;
    int min = 0,max = array.count - 1;
    int mid = max / 2;
    while (min <= max) {
        if ([array[mid] intValue] > target && [array[min] intValue] <= target) {
            max = mid-1;
            mid =( max + min )/2;
        }else if ([array[mid] intValue] == target){
            return mid;
        }
        else{
            min = mid + 1;
            mid = ( max + min )/2;
        }
    }
    return iRet;
}


@end
