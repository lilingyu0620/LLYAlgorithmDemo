//
//  HeapSort.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/20.
//  Copyright © 2018年 lly. All rights reserved.
//


//http://bubkoo.com/2014/01/14/sort-algorithm/heap-sort/

#import "HeapSort.h"

@implementation HeapSort{
    NSMutableArray *_array;
}


- (instancetype)init{
    
    self = [super init];
    if (self) {
        _array = [NSMutableArray arrayWithArray:@[@12,@36,@24,@85,@47,@30,@53,@91]];
        NSLog(@"__array = %@",_array);
        [self heapSort:_array size:_array.count];
        NSLog(@"__array = %@",_array);
    }
    return self;
}


- (void)adjustHeap:(NSMutableArray *)array index:(int)index size:(NSInteger)size{
    
    int i = index * 2 + 1;
    int j = (index + 1) * 2;
    int maxIndex = index;
    if (i < size && [array[index] intValue] < [array[i] intValue]) {
        maxIndex = i;
    }
    if (j < size && [array[maxIndex] intValue] < [array[j] intValue]) {
        maxIndex = j;
    }
    
    if (index == maxIndex) {
        return;
    }
    
    [self swap:array index1:index index2:maxIndex];
    
    [self adjustHeap:array index:maxIndex size:size];
    
}

- (void)heapSort:(NSMutableArray *)array size:(int)size{
    
    //建堆
    for (int i = floor(size/2); i >= 0; i--) {
        [self adjustHeap:array index:i size:size];
    }
    
    //排序
    for (int i = size - 1; i > 0; i--) {
        [self swap:array index1:0 index2:i];
        [self adjustHeap:array index:0 size:i-1];
    }
}


- (void)swap:(NSMutableArray *)array index1:(int)index1 index2:(int)index2 {
    id tmp = array[index1];
    array[index1] = array[index2];
    array[index2] = tmp;
}

@end
