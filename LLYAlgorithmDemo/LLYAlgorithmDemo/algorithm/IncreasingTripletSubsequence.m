//
//  IncreasingTripletSubsequence.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/1/23.
//  Copyright © 2019 lly. All rights reserved.
//


//Given an unsorted array return whether an increasing subsequence of length 3 exists or not in the array.
//
//Formally the function should:
//
//Return true if there exists i, j, k
//such that arr[i] < arr[j] < arr[k] given 0 ≤ i < j < k ≤ n-1 else return false.
//Note: Your algorithm should run in O(n) time complexity and O(1) space complexity.
//
//Example 1:
//
//Input: [1,2,3,4,5]
//Output: true
//Example 2:
//
//Input: [5,4,3,2,1]
//Output: false


#import "IncreasingTripletSubsequence.h"

@implementation IncreasingTripletSubsequence

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        BOOL isTriplet = [self increasingTripletSubsequence:@[@1,@5,@2,@4,@3]];
//        BOOL isTriplet = [self increasingTripletSubsequence:@[@1,@2,@3,@4,@5]];
        BOOL isTriplet = [self increasingTripletSubsequence:@[@5,@4,@3,@2,@1]];
        NSLog(@"isTriplet = %ld",(long)isTriplet);
        
    }
    return self;
}

- (BOOL)increasingTripletSubsequence:(NSArray *)array{
    
    NSInteger min,max,maxcount = 1,mincount = 1;
    
    min = [array.firstObject integerValue];
    max = [array.firstObject integerValue];
    
    for (int i = 1; i < array.count; i++) {
        
        NSInteger ele = [array[i] integerValue];
        
        if (ele >= max) {
            maxcount++;
            max = ele;
        }
        else{
            if (ele < min && mincount < 3) {
                min = ele;
                mincount = 1;
            }else if(ele > min){
                mincount++;
                min = ele;
            }
        }
    }
    
    return maxcount >= 3 || mincount >= 3;
}

@end
