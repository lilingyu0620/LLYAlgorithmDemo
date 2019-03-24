//
//  NumbersUniqueDigits.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/3/24.
//  Copyright © 2019 lly. All rights reserved.
//


//357. Count Numbers with Unique Digits
//Medium
//
//220
//
//566
//
//Favorite
//
//Share
//Given a non-negative integer n, count all numbers with unique digits, x, where 0 ≤ x < 10n.
//
//Example:
//
//Input: 2
//Output: 91
//Explanation: The answer should be the total numbers in the range of 0 ≤ x < 100,
//excluding 11,22,33,44,55,66,77,88,99


#import "NumbersUniqueDigits.h"

@implementation NumbersUniqueDigits

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSInteger count = [self numbersUniqueDigits:10000];
        NSLog(@"count = %ld",(long)count);
    }
    return self;
}

- (NSInteger)numbersUniqueDigits:(NSInteger)num{
    
    NSInteger count = 0;
    for (int i = 0; i < num; i++) {
        if ([self isUnique:i]) {
            count++;
        }
    }
    return count;
    
}

- (BOOL)isUnique:(NSInteger)num{
    
    NSInteger sameNum = num;
    
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        array[i] = @(0);
    }
    
    NSInteger div = 0;
    while(num >= 10){
        div = num % 10;
        if ([array[div] integerValue] == 0) {
            array[div] = @(1);
        }
        else{
            NSLog(@"sameNum = %ld",(long)sameNum);
            return NO;
        }
        num /= 10;
    }
    
    if ([array[num] integerValue] == 0) {
        return YES;
    }
    else{
        NSLog(@"sameNum = %ld",(long)sameNum);
        return NO;
    }
    
}

@end
