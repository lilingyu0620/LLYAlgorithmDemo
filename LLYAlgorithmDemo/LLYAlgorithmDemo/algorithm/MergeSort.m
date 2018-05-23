//
//  MergeSort.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/23.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort{
    NSMutableArray *_desArray;
    NSMutableArray *_sourceArray;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _sourceArray = [NSMutableArray arrayWithArray:@[@6,@1,@2,@5,@4,@3,@7,@10,@8]];
        _desArray = [NSMutableArray arrayWithCapacity:_sourceArray.count];
        NSLog(@"_sourceArray = %@",_sourceArray);
        [self mergeSort:_sourceArray desArray:_desArray index1:0 index2:(_sourceArray.count - 1)];
        NSLog(@"_desArray = %@",_desArray);

        
    }
    return self;
}


- (void)sort:(NSMutableArray *)sourceArray desArray:(NSMutableArray *)desArray index1:(int)m mid:(int)mid index2:(int)n{
    
    if (m >= n) {
        return;
    }
    
    NSLog(@"m = %d,mid = %d,n = %d",m,mid,n);
    
    int i = m,j = mid+1;
    int index = m;
    while (i <= mid && j <= n) {
        
        if ([sourceArray[i] intValue] < [sourceArray[j] intValue]) {
            desArray[index++] = sourceArray[i++];
        }
        
        if ([sourceArray[i] intValue] >= [sourceArray[j] intValue]) {
            desArray[index++] = sourceArray[j++];
        }
        
    }
    
    while (i <= mid) {
        desArray[index++] = sourceArray[i++];
    }
    
    while (j <= n) {
        desArray[index++] = sourceArray[j++];
    }
    
    NSLog(@"_desArray = %@",_desArray);

    for (int i = 0; i < index; i++) {
        sourceArray[i] = desArray[i];
    }
    
    NSLog(@"_sourceArray = %@",_sourceArray);

}

- (void)mergeSort:(NSMutableArray *)sourceArray desArray:(NSMutableArray *)desArray index1:(int)m index2:(int)n{
    
    if (m < n) {
        int mid = (m + n)/2;
        
        NSLog(@"m = %d,mid = %d,n = %d",m,mid,n);
        
        [self mergeSort:sourceArray desArray:desArray index1:m index2:mid];
        [self mergeSort:sourceArray desArray:desArray index1:mid + 1 index2:n];
        [self sort:sourceArray desArray:desArray index1:m mid:mid index2:n];
    }
    
   
    
}


@end
