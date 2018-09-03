//
//  SlidingWindowMaximum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/3.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "SlidingWindowMaximum.h"

@implementation SlidingWindowMaximum

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *array = [self slidingWindowMaximum:@[@1,@3,@-1,@-3,@5,@3,@6,@7] k:3];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)slidingWindowMaximum:(NSArray *)array k:(int)k{
    
    NSMutableArray *queue = [NSMutableArray array];
    NSMutableArray *bArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        
        if (i >= k) {
            
            int max = NSIntegerMin;
            for (id num in queue) {
                max = MAX(max, [num intValue]);
            }
            [bArray addObject:@(max)];
            
            [queue removeObjectAtIndex:0];
            [queue addObject:array[i]];
            
        }
        else{
            [queue addObject:array[i]];
        }
        
        
    }
    
    int max = NSIntegerMin;
    for (id num in queue) {
        max = MAX(max, [num intValue]);
    }
    [bArray addObject:@(max)];

    
    return bArray;
    
}

@end
