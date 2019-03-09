//
//  TopKFrequentElements.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/2/18.
//  Copyright © 2019 lly. All rights reserved.
//

//Given a non-empty array of integers, return the k most frequent elements.
//
//Example 1:
//
//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]
//Example 2:
//
//Input: nums = [1], k = 1
//Output: [1]
//Note:
//
//You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
//Your algorithm's time complexity must be better than O(n log n), where n is the array's size.


#import "TopKFrequentElements.h"

@implementation TopKFrequentElements

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *array = [self topKFrequentElements:@[@1,@1,@1,@2,@2,@3,@4,@4,@4,@4,@4,] k:2];
        NSArray *array = [self topKFrequentElements:@[@1] k:1];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)topKFrequentElements:(NSArray *)array k:(NSInteger)k{
    
    NSMutableArray *indexArray = [NSMutableArray array];
    
    for (int i = 0; i <= array.count; i++) {
        [indexArray addObject:@(0)];
    }
    
    for (int i = 0; i < array.count; i++) {
        NSInteger fre = [indexArray[[array[i] integerValue]] integerValue];
        fre++;
        indexArray[[array[i] integerValue]] = @(fre);
    }
    
    NSMutableArray *sortArray = [NSMutableArray arrayWithArray:indexArray];
    
    [self quickSort:sortArray];
    
    NSLog(@"indexArray = %@",sortArray);

    
    NSMutableArray *kArray = [NSMutableArray array];
    for (NSInteger i = sortArray.count - 1; i > sortArray.count - 1 - k; i--) {
        [kArray addObject:sortArray[i]];
    }
    
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    for (int i = 0; i < kArray.count; i++) {
        
        NSInteger idx = [indexArray indexOfObject:kArray[i]];
        [retArray addObject:@(idx)];
        
    }
    
    
    return retArray;
}


- (void)quickSort:(NSMutableArray *)array index1:(int)m index2:(int)n{
    
    if (m > n) {
        return;
    }
    
    int pivot = [array[m] intValue];
    int pIndex = m;
    int i = m,j = n;
    
    while (i != j) {
        while ([array[j] intValue] >= pivot && i < j) {
            j--;
        }
        
        while ([array[i] intValue] <= pivot && i < j) {
            i++;
        }
        
        if (i < j) {
            [self swap:array index1:i index2:j];
        }
    }
    
    array[pIndex] = array[i];
    array[i] = @(pivot);
    
    [self quickSort:array index1:m index2:i-1];
    [self quickSort:array index1:i+1 index2:n];
    
}

- (void)quickSort:(NSMutableArray *)array{
    
    [self quickSort:array index1:0 index2:array.count - 1];
    
}

- (void)swap:(NSMutableArray *)array index1:(int)index1 index2:(int)index2 {
    id tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
}

@end
