//
//  SumTwoIntegers.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/3/30.
//  Copyright © 2019 lly. All rights reserved.
//

//371. Sum of Two Integers
//Easy
//
//695
//
//1174
//
//Favorite
//
//Share
//Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
//
//Example 1:
//
//Input: a = 1, b = 2
//Output: 3
//Example 2:
//
//Input: a = -2, b = 3
//Output: 1

#import "SumTwoIntegers.h"

@implementation SumTwoIntegers

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSInteger sum = [self sumTwoIntegers:5 num2:8];
        NSLog(@"sum = %ld",(long)sum);
        
    }
    return self;
}

- (NSInteger)sumTwoIntegers:(NSInteger)num1 num2:(NSInteger)num2{
    
    if (num2 > 0) {
        NSInteger carry = num1 & num2;//对应位上如果都是1则需要进一位。有几个相同的1就需要进几位
        num1 = num1 ^ num2;//找出不同的1
        num2 = carry << 1;//进一位
    }
    return num1;
}

@end
