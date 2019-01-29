//
//  PowerOfFour.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/1/29.
//  Copyright © 2019 lly. All rights reserved.
//

#import "PowerOfFour.h"

@implementation PowerOfFour

- (instancetype)init
{
    self = [super init];
    if (self) {

        for (int i = 1; i <= 65535; i++) {
            if ([self isPowerOfFour:i]) {
                NSLog(@"%ld isPowerFour",(long)i);
            }
        }
        
    }
    return self;
}

- (BOOL)isPowerOfFour:(NSInteger) element{
    
    if (element < 4) {
        return NO;
    }
    
    NSInteger tmp = element;
    NSInteger div;
    
    div = tmp % 4;
    tmp = tmp / 4;
    
    while (div == 0 && tmp > 1) {
        div = tmp % 4;
        tmp = tmp / 4;
    }
    
    if (div == 0 && tmp == 1) {
        return YES;
    }
    
    return NO;
    
}

@end
