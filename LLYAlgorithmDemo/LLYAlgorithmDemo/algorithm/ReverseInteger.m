//
//  ReverseInteger.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/14.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a 32-bit signed integer, reverse digits of an integer.
//
//Example 1:
//
//Input: 123
//Output: 321
//Example 2:
//
//Input: -123
//Output: -321
//Example 3:
//
//Input: 120
//Output: 21

#import "ReverseInteger.h"

@implementation ReverseInteger

- (instancetype)init{
    self = [super init];
    if (self) {
        NSInteger result = [self reverseInter:-12345670000];
        NSLog(@"result = %ld",(long)result);
    }
    return self;
}


- (NSInteger)reverseInter:(NSInteger)inter{
    
    BOOL isMinus = NO;
    if (inter < 0) {
        inter *= -1;
        isMinus = YES;
    }
    NSInteger div = inter;
    NSInteger result = 0;
    while (div >= 10) {
        NSInteger bit = div % 10;
        result  = result * 10 + bit;
        div = div/10;
    }
    if (div > 0) {
        result  = result * 10 + div;
    }
    
    if (isMinus) {
        result *= -1;
    }
    
    return result;
}

@end
