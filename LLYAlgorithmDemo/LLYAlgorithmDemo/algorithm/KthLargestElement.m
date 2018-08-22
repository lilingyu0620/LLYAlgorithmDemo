//
//  KthLargestElement.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/22.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "KthLargestElement.h"

@implementation KthLargestElement

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int maxK = [self kthLargestElement:[NSMutableArray arrayWithArray:@[@3,@2,@1,@5,@6,@4]] k:2];
//        int maxK = [self kthLargestElement:[NSMutableArray arrayWithArray:@[@3,@2,@3,@1,@2,@4,@5,@5,@6]] k:4];
        NSLog(@"maxK = %ld",maxK);
    }
    return self;
}

- (int)kthLargestElement:(NSMutableArray *)array k:(int)k{
    
    for (int i = floor(array.count/2); i >= 0; i--) {
        [self adjustHeap:array index:i size:array.count-1];
    }
    
    NSLog(@"array = %@",array);
    
    for (int i = 0; i < k; i++) {

        id tmp = array[i];
        array[i] = array[array.count - 1];
        array[array.count-1] = tmp;

        [self adjustHeap:array index:0 size:array.count-1-i];
    }
    
    NSLog(@"array = %@",array);
    
    return [array[k-1] intValue];
    
}


- (void)adjustHeap:(NSMutableArray *)array index:(int)index size:(int)size{
    
    int maxIndex = index;
    
    int maxcur = [array[index] intValue];
    
    int leftIndex = (index * 2) + 1;
    int rightIndex = (index+1) * 2;
    
    if (leftIndex < size && [array[leftIndex] intValue] >= maxcur) {
        maxcur = [array[leftIndex] intValue];
        maxIndex = leftIndex;
    }
    
    if (rightIndex < size && [array[rightIndex] intValue] >= maxcur) {
        maxcur = [array[rightIndex] intValue];
        maxIndex = rightIndex;
    }
    if (index == maxIndex) {
        return;
    }
    
    array[maxIndex] = array[index];
    array[index] = @(maxcur);
    
    [self adjustHeap:array index:maxIndex size:size];
    
}


@end
