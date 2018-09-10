//
//  SingleNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/29.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a non-empty array of integers, every element appears twice except for one. Find that single one.
//
//Note:
//
//Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//
//Example 1:
//
//Input: [2,2,1]
//Output: 1
//Example 2:
//
//Input: [4,1,2,1,2]
//Output: 4

#import "SingleNumber.h"

@implementation SingleNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int single = [self singleNumber:@[@2,@2,@1]];
        int single = [self singleNumber:@[@0,@1,@0,@1,@0,@1,@99]];
        NSLog(@"single = %ld",(long)single);
        
        single = [self singleNumber2:@[@4,@1,@2,@1,@2]];
        NSLog(@"single = %ld",(long)single);
        
        single = [self singleNumber3:@[@0,@1,@0,@1,@0,@1,@99]];
        NSLog(@"single = %ld",(long)single);
        
        NSArray *array = [self singleNumbers:@[@1,@1,@2,@2,@5,@4]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (int)singleNumber:(NSArray *)array{
    
    int maxIndex = -1;
    for (int i = 0; i < array.count; i++) {
        if (maxIndex < [array[i] intValue]) {
            maxIndex = [array[i] intValue];
        }
    }
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:maxIndex];
    
    for (int i = 0; i <= maxIndex; i++) {
        [tmpArray addObject:@(-1)];
    }
    
    for (int i = 0; i < array.count; i++) {
        
        if ([tmpArray[[array[i] intValue]] intValue] == -1) {
            tmpArray[[array[i] intValue]] = @(1);
        }
        else if ([tmpArray[[array[i] intValue]] intValue] == 1){
            tmpArray[[array[i] intValue]] = @(0);
        }
        
    }
    
    for (int i = 0; i < tmpArray.count; i++) {
        if ([tmpArray[i] intValue] == 1) {
            return i;
        }
    }

    return -1;
}

- (int)singleNumber2:(NSArray *)array{
    
    int result = 0;
    for (int i = 0; i < array.count; i++) {
        result ^= [array[i] intValue];
    }
    return result;
}

- (int)singleNumber3:(NSArray *)array{
    
    int one = 0,two = 0;
    for (int i = 0; i < array.count; i++) {
        
        one = (one ^ [array[i] intValue]) & ~two;//记录出现一次的
        two = (two ^ [array[i] intValue]) & ~one;//记录出现二次的
        
    }
    
    return one;
}

- (NSArray *)singleNumbers:(NSArray *)array{
    
    int ret = 0;
    for (int i = 0; i < array.count; i++) {
        ret ^= [array[i] intValue];
    }
    
//    ret &= -ret;
    
    int num1 = 0,num2 = 0;
    for (int i = 0; i < array.count; i++) {
        if (([array[i] intValue] & ret) == 0) {
            num1 ^= [array[i] intValue];
        }else{
            num2 ^= [array[i] intValue];
        }
    }

    return @[@(num1),@(num2)];
    
}

@end
