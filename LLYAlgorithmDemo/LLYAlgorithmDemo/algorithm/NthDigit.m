//
//  NthDigit.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/5/10.
//  Copyright © 2019 lly. All rights reserved.
//

//Find the nth digit of the infinite integer sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...
//
//Note:
//n is positive and will fit within the range of a 32-bit signed integer (n < 231).
//
//Example 1:
//
//Input:
//3
//
//Output:
//3
//Example 2:
//
//Input:
//11
//
//Output:
//0
//
//Explanation:
//The 11th digit of the sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... is a 0, which is part of the number 10.


//https://blog.csdn.net/MebiuW/article/details/52575028



#import "NthDigit.h"

@implementation NthDigit

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i = 1; i <= 36000+2700+189; i++) {
            NSInteger num = [self findNthDigit:i];
            NSLog(@"num = %ld",num);
        }
    }
    return self;
}

//暂时最大支持9999个数字吧
- (NSInteger)findNthDigit:(NSInteger)n{
    
    if (n > 0 && n <= 9) {
        //0-9
        return n;
    }
    else if (n > 9 && n <= 189){
        //10-99
        NSInteger nn = n - 10;
        NSInteger num = nn/2;
        NSInteger div = nn%2;
        num += 10;
        NSString *str = [@(num) stringValue];
        return [[str substringWithRange:NSMakeRange(div, 1)] integerValue];
    }
    else if (n > 189 && n <= (2700+189)){
        //100-999
        NSInteger nn = n - 190;
        NSInteger num = nn/3;
        NSInteger div = nn%3;
        num += 100;
        NSString *str = [@(num) stringValue];
        return [[str substringWithRange:NSMakeRange(div, 1)] integerValue];
    }
    else if (n > (2700+189) && n <= (36000+2700+189)){
        //1000-9999
        NSInteger nn = n - (2700+190);
        NSInteger num = nn/4;
        NSInteger div = nn%4;
        num += 1000;
        NSString *str = [@(num) stringValue];
        return [[str substringWithRange:NSMakeRange(div, 1)] integerValue];
        
    }else{
        return -1;
    }
    
}

@end
