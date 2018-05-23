//
//  QuickSort.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/23.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort{
    NSMutableArray *_array;
}

- (instancetype)init{
    self = [super init];
    if (self) {

        _array = [NSMutableArray arrayWithArray:@[@6,@1,@2,@5,@4,@3,@7,@10,@8]];
        NSLog(@"array = %@",_array);
        [self quickSort:_array];
        NSLog(@"array = %@",_array);

    }
    return self;
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
