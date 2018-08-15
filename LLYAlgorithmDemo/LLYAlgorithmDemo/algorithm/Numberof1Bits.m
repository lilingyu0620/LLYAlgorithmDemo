//
//  Numberof1Bits.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/15.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "Numberof1Bits.h"

@implementation Numberof1Bits

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int bit = [self numberof1Bits:128];
        NSLog(@"bit = %d",bit);
    }
    return self;
}

- (int)numberof1Bits:(int)num{
    
    int ret = 0;
    while (num > 0) {
        int bit = num%2;
        if (bit == 1) {
            ret++;
        }
        num /= 2;
    }
    return ret;
}


@end
