//
//  TrappingRainWater.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/6.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//
//
//The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
//
//Example:
//
//Input: [0,1,0,2,1,0,1,3,2,1,2,1]
//Output: 6


#import "TrappingRainWater.h"

@implementation TrappingRainWater


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
     
        int res = [self trappingRainWater:@[@0,@1,@0,@2,@1,@0,@1,@3,@2,@1,@2,@1]];
        NSLog(@"res = %d",res);
    }
    
    return self;
    
}

- (int)trappingRainWater:(NSArray *)array{
    
    int res = 0;
    int left = 0,right = array.count - 1;
    int maxLeft = 0,maxRight = 0;
    while (left < right) {
        if ([array[left] intValue] <= [array[right] intValue]) {
            if ([array[left] intValue] >= maxLeft) {
                maxLeft = [array[left] intValue];
            }
            else{
                res += maxLeft - [array[left] intValue];
            }
            left++;
        }
        else{
            if ([array[right] intValue] >= maxRight) {
                maxRight = [array[right] intValue];
            }
            else{
                res += maxRight - [array[right] intValue];
            }
            right--;
        }
    }
    
    return res;
}

@end
