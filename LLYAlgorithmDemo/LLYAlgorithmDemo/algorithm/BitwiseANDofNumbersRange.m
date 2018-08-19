//
//  BitwiseANDofNumbersRange.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/19.
//  Copyright © 2018 lly. All rights reserved.
//

#import "BitwiseANDofNumbersRange.h"

@implementation BitwiseANDofNumbersRange


- (instancetype)init
{
    self = [super init];
    if (self) {
     
        int sum = [self bitwiseANDofNumbersRange:26 max:30];
        NSLog(@"sum = %d",sum);
    }
    return self;
}


- (int)bitwiseANDofNumbersRange:(int)min max:(int)max{
    
    
//    int ret = min;
//    for (int i = min+1; i <= max; i++) {
//
//        ret &= i;
//    }
//
//    return ret;
    
    int minus = max ^ min;
    int bits = [self bits:minus];
    int m1 = [self nums:bits];
    m1 ^= NSIntegerMax;
    m1 |= minus;
    return min & max & m1;
    
}

- (int)bits:(int)num{
    
    int bits = 0;
    while (num > 0) {
        num >>= 1;
        bits++;
    }
    return bits;
    
}

- (int)nums:(int)bits{
    
    int nums = 0;
    int bit = 1;
    for (int i = 0; i < bits; i++) {
        nums += bit;
        bit *= 2;
    }
    return nums;
}

@end
