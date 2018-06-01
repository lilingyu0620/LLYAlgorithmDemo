//
//  HalfRepeat.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/1.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "HalfRepeat.h"

//找出数组中重复次数超过一半的数

@implementation HalfRepeat

- (instancetype)init{
    self = [super init];
    if (self) {
        
        int repeatCount = [self halfRepeat:@[@1,@2,@2,@1,@2,@5,@2,@2]];
        NSLog(@"repeatCount = %d",repeatCount);
        
    }
    return self;
}

- (BOOL)isHalfRepeat:(int)repeatNum array:(NSArray *)array{
    
    int repeatCount = 0;
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] intValue] == repeatNum) {
            repeatCount++;
        }
    }
    
    return (repeatCount > array.count/2);
    
}

- (int)halfRepeat:(NSArray *)array{
    
    int repeatCount = 1,element = [array[0] intValue];
    
    for (int i = 1; i < array.count; i++) {
     
        int num = [array[i] intValue];
        
        if (repeatCount == 0) {
            element = num;
            repeatCount = 1;
        }
        else if (element != num) {
            repeatCount--;
        }
        else {
            repeatCount++;
        }
    }
    
    if ([self isHalfRepeat:element array:array]) {
        return element;
    }
    else{
        return -1;
    }
}

@end
