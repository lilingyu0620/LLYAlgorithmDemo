//
//  CountingBits.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/2/15.
//  Copyright © 2019 lly. All rights reserved.
//

#import "CountingBits.h"

@implementation CountingBits

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self countingBits2:15];
        
    }
    return self;
}


- (void)countingBits:(int)num{
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@(0)];
    
    for (int i = 1; i <= num; i++) {
        int c = [array[i & (i-1)] intValue] + 1;
        [array addObject:@(c)];
    }
    
    NSLog(@"array = %@",array);
    
}

- (void)countingBits2:(int)num{
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@(0)];
    
    for (int i = 1; i <= num; i++) {
        
        int c = [array[i >> 1] intValue] + (i & 0x1);
        [array addObject:@(c)];
        
    }
    
    NSLog(@"array = %@",array);
    
}

@end
