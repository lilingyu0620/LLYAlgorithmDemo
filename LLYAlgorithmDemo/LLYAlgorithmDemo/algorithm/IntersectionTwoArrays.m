//
//  IntersectionTwoArrays.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/3/9.
//  Copyright © 2019 lly. All rights reserved.
//

//
//349. Intersection of Two Arrays
//Easy
//
//350
//
//718
//
//Favorite
//
//Share
//Given two arrays, write a function to compute their intersection.
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Note:
//
//Each element in the result must be unique.
//The result can be in any order.


#import "IntersectionTwoArrays.h"

@implementation IntersectionTwoArrays

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *array1 = @[@1,@2,@2,@1];
//        NSArray *array2 = @[@2,@2];
        NSArray *array1 = @[@4,@9,@5];
        NSArray *array2 = @[@9,@4,@9,@8,@4];
        
        NSArray *array = [self intersectionTwoArrays:array1 array2:array2];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)intersectionTwoArrays:(NSArray *)array1 array2:(NSArray *)array2{
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (NSNumber *num in array1) {
        
        if (NSNotFound != [array2 indexOfObject:num]) {
            
            if (NSNotFound == [tmpArray indexOfObject:num]) {
                
                [tmpArray addObject:num];
                
            }
            
        }
        
    }
    
    return tmpArray;
    
}

@end
