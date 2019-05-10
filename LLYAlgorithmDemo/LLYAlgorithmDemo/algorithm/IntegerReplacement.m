//
//  IntegerReplacement.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/5/10.
//  Copyright © 2019 lly. All rights reserved.
//

//Given a positive integer n and you can do operations as follow:
//
//If n is even, replace n with n/2.
//If n is odd, you can replace n with either n + 1 or n - 1.
//What is the minimum number of replacements needed for n to become 1?
//
//Example 1:
//
//Input:
//8
//
//Output:
//3
//
//Explanation:
//8 -> 4 -> 2 -> 1
//Example 2:
//
//Input:
//7
//
//Output:
//4
//
//Explanation:
//7 -> 8 -> 4 -> 2 -> 1
//or
//7 -> 6 -> 3 -> 2 -> 1

#import "IntegerReplacement.h"

@implementation IntegerReplacement

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSInteger times = [self integerReplacement:8];
        NSLog(@"times = %ld",times);
        
    }
    return self;
}

- (NSInteger)integerReplacement:(NSInteger)n{
    
    NSInteger times = 0;
    
    while (n != 1) {
        if (n % 2 == 0) {
            times++;
            n /= 2;
        }
        else{
            //如果最后2位都是1就不能+1,会造成进位
            if ((n & 0x01) == 1 && ((n >> 1) & 0x01) == 1) {
                n -= 1;
            }
            else{
                n += 1;
            }
            times++;
        }
    }
    
    return times;
}

@end
