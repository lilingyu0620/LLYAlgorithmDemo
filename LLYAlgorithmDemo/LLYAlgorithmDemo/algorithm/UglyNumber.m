//
//  UglyNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/11.
//  Copyright © 2018年 lly. All rights reserved.
//

//Write a program to check whether a given number is an ugly number.
//
//Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
//
//Example 1:
//
//Input: 6
//Output: true
//Explanation: 6 = 2 × 3
//Example 2:
//
//Input: 8
//Output: true
//Explanation: 8 = 2 × 2 × 2
//Example 3:
//
//Input: 14
//Output: false
//Explanation: 14 is not ugly since it includes another prime factor 7.

#import "UglyNumber.h"

@implementation UglyNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        BOOL bRet = [self uglyNumber:80];
        NSLog(@"bRet = %d",bRet);
        
        int num = [self uglyNumber2:30];
        NSLog(@"num = %d",num);
        
    }
    return self;
}

- (BOOL)uglyNumber:(int)num{
    
    BOOL bRet = YES;
    
    while (num != 1) {
        if ((num % 2) == 0) {
            num /= 2;
        }
        else if((num % 3) == 0){
            num /= 3;
        }
        else if ((num % 5) == 0){
            num /= 5;
        }else{
            return NO;
        }
    }
    return bRet;
}

- (int)uglyNumber2:(int)num{
    
    int nums = 0,i = 1;
    while (nums < num) {
        if ([self uglyNumber:i]) {
            nums++;
        }
        i++;
    }
    return i-1;
    
}

@end
