//
//  StringToInteger.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/14.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "StringToInteger.h"

//Note:
//
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//
//Input: "42"
//Output: 42
//Example 2:
//
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//Then take as many numerical digits as possible, which gets 42.
//Example 3:
//
//Input: "4193 with words"
//Output: 4193
//Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
//Example 4:
//
//Input: "words and 987"
//Output: 0
//Explanation: The first non-whitespace character is 'w', which is not a numerical
//digit or a +/- sign. Therefore no valid conversion could be performed.
//Example 5:
//
//Input: "-91283472332"
//Output: -2147483648
//Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
//Thefore INT_MIN (−231) is returned.

@implementation StringToInteger

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        NSInteger atoi = [self stringToInteger:@"   -42"];
        NSLog(@"atoi = %ld",(long)atoi);
    }
    
    return self;
}

- (NSInteger)stringToInteger:(NSString *)str{
    
    NSString *withOutBlank = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSInteger length = [withOutBlank length];
    NSInteger iResult = 0,index = 0;
    BOOL isMinus = NO;
    
    while (index < length) {
        unichar cc = [withOutBlank characterAtIndex:index];
        NSString *cStr = [NSString stringWithFormat:@"%c",cc];
        index++;
        if (iResult == 0 && [cStr isEqualToString:@"-"]) {
            isMinus = YES;
            continue;
        }
        if (cc == ' ') {
            continue;
        }
        if (cc < '0' || cc > '9') {
            break;
        }
        iResult = iResult * 10 + [cStr integerValue];
    }
    if (isMinus) {
        iResult *= -1;
    }
    return iResult;
}

@end
