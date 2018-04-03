//
//  ArrayToSum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/4/3.
//  Copyright © 2018年 lly. All rights reserved.
//

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example
//
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

#import "ArrayToSum.h"

@implementation ArrayToSum

- (instancetype)init{
    self = [super init];
    if (self) {
        NSArray *array = [self arrayToSumWithArray1:@[@2,@4,@3] array2:@[@5,@6,@4]];
        if (array) {
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@",obj);
            }];
        }
    }
    return self;
}

- (NSArray *)arrayToSumWithArray1:(NSArray *)array1 array2:(NSArray *)array2{
    
    NSArray *reArray1 = [[array1 reverseObjectEnumerator] allObjects];
    NSArray *reArray2 = [[array2 reverseObjectEnumerator] allObjects];
    
    int sum1 = 0,sum2 = 0,sum = 0;
    
    sum1 = [self sumArray:reArray1];
    sum2 = [self sumArray:reArray2];
    
    sum = sum1 + sum2;
    
    return [self numberToArray:sum];;
}

- (int)sumArray:(NSArray *)array{
    
    __block int sum = 0;
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        sum = sum*10 + [obj intValue];
    }];
    return sum;
}

- (NSArray *)numberToArray:(int)num{
    
    NSMutableArray *numArray = [NSMutableArray array];
    while (num >= 10) {
        int m = num%10;
        [numArray addObject:@(m)];
        num = num/10;
    }
    [numArray addObject:@(num)];
    return numArray;
}

@end
