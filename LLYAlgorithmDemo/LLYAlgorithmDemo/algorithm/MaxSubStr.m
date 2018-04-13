//
//  MaxSubStr.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/4/4.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

//理解题目：找出字符串中的最大不重复子串。即该子串中没有重复的字符。

#import "MaxSubStr.h"

@implementation MaxSubStr

- (instancetype)init{
    self = [super init];
    if (self) {
        NSString *subStr = [self maxSubStr:@"pwwkew"];
        NSLog(@"subStr = %@",subStr);
    }
    return self;
}

- (NSString *)maxSubStr:(NSString *)str{
    NSString *sRet;
    for (int i = 0; i < str.length; i++) {
        for (int j = i; j < str.length; j++) {
            NSString *tStr = [str substringWithRange:NSMakeRange(i, j-i+1)];
            //子串中没有重复字符
            if (tStr.length < 2 || ![self hasRepeatChar:tStr]) {
                if (sRet.length < tStr.length) {
                    sRet = tStr;
                }
            }
            else{
                //有重复字符
                break;
            }
        }
    }
    
    return sRet;
}

- (BOOL)hasRepeatChar:(NSString *)str{    
    for (int i = 0; i < str.length; i++) {
        NSString *charStr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *subStr = [str substringWithRange:NSMakeRange(i+1, str.length - i-1)];
        if ([subStr containsString:charStr]) {
            return YES;
        }
    }
    return NO;
}


@end
