//
//  CountingBits.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/2/15.
//  Copyright © 2019 lly. All rights reserved.
//

//338. Counting Bits
//Medium
//
//1150
//
//80
//
//Favorite
//
//Share
//Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
//
//Example 1:
//
//Input: 2
//Output: [0,1,1]
//Example 2:
//
//Input: 5
//Output: [0,1,1,2,1,2]
//Follow up:
//
//It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
//Space complexity should be O(n).
//Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.

#import "CountingBits.h"

@implementation CountingBits

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self countingBits2:15];
        
    }
    return self;
}


- (void)countingBits:(int)num{
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@(0)];
    
    for (int i = 1; i <= num; i++) {
        int c = [array[i & (i-1)] intValue] + 1;
        [array addObject:@(c)];
    }
    
    NSLog(@"array = %@",array);
    
}

- (void)countingBits2:(int)num{
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@(0)];
    
    for (int i = 1; i <= num; i++) {
        
        int c = [array[i >> 1] intValue] + (i & 0x1);
        [array addObject:@(c)];
        
    }
    
    NSLog(@"array = %@",array);
    
}

@end
