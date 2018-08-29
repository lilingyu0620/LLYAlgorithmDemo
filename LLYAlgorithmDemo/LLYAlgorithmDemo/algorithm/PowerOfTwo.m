//
//  PowerOfTwo.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/29.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "PowerOfTwo.h"

@implementation PowerOfTwo

- (instancetype)init
{
    self = [super init];
    if (self) {
        BOOL isPower = [self isPowerOfTwo:16];
        NSLog(@"isPower = %d",isPower);
    }
    return self;
}


- (BOOL)isPowerOfTwo:(int)n{
    
    int div = 0;
    while (n > 1) {
        div = n%2;
        if (div == 1) {
            return NO;
        }
        n /=  2;
    }
    return div == 0;
}

@end
