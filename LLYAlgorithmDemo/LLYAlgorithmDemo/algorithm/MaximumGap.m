//
//  MaximumGap.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/9.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MaximumGap.h"

@implementation MaximumGap{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray arrayWithArray:@[@3,@4,@9,@1,@0]];
        [self quickSort:_array start:0 end:_array.count - 1];

        NSLog(@"_array = %@",_array);

        int ret = [self maximumGap:[NSArray arrayWithArray:_array]];
        NSLog(@"ret = %d",ret);
    }
    return self;
}

- (int)maximumGap:(NSArray *)array{
    
    int ret = 0;
    
    if (array.count < 2) {
        return ret;
    }
    
    ret = NSIntegerMin;
    for (int i = 1; i < array.count; i++) {
        ret = MAX(ret, ([array[i] intValue] - [array[i-1] intValue]));
    }
    
    return ret;
}

- (void)quickSort:(NSMutableArray *)array start:(int)start end:(int)end{
    
    if (start > end) {
        return;
    }
    
    int pivot = [array[start] intValue];
    int i = start,j = end;
    while (i != j) {
        
        while ([array[j] intValue] >= pivot && i < j) {
            j--;
        }
        
        while ([array[i] intValue] <= pivot && i < j) {
            i++;
        }
        
        if(i < j){
            id tmp = array[i];
            array[i] = array[j];
            array[j] = tmp;
        }
        
    }
    
    array[start] = array[i];
    array[i] = @(pivot);
    
    [self quickSort:array start:start end:i-1];
    [self quickSort:array start:i + 1 end:end];
    
}


@end
