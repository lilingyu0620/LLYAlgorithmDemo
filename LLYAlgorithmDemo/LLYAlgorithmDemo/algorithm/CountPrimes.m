//
//  CountPrimes.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/20.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CountPrimes.h"

@implementation CountPrimes

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *array = [self countPrimes:20];
        NSLog(@"array = %@",array);
    }
    return self;
}

- (NSMutableArray *)countPrimes:(int)num{
    NSMutableArray *retArray = [NSMutableArray array];
    for (int i = 1; i <= num; i++) {
        if ([self isPrime:i]) {
            [retArray addObject:@(i)];
        }
    }
    return  retArray;
}

- (BOOL)isPrime:(int)num{
    
    if (num == 1) {
        return NO;
    }
    if (num == 2) {
        return YES;
    }
    for (int i = 2; i <= (num - 1); i++) {
        if (num%i == 0) {
            return NO;
        }
    }
    return YES;
    
}

@end
