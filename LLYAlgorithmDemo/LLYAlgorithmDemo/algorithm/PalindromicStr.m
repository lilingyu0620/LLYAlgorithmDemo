//
//  PalindromicStr.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/2.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example 1:
//
//Input: "babad"
//Output: "bab"
//Note: "aba" is also a valid answer.
//Example 2:
//
//Input: "cbbd"
//Output: "bb"

//找出一个字符串中的回文子串

#import "PalindromicStr.h"

@implementation PalindromicStr

- (instancetype)init{
    self = [super init];
    if (self) {
        NSString *paliStr = [self palindromicStr:@"dcdbacbcacbd"];
        NSLog(@"palistr = %@",paliStr);
    }
    return self;
}


- (NSString *)palindromicStr:(NSString *)str{
    NSString *sRet;
    for (int i = 0; i < str.length; i++) {
        for (int j = i; j < str.length; j++) {
            NSString *tStr = [str substringWithRange:NSMakeRange(i, j-i+1)];
            //是回文
            if (tStr.length < 2 || [self isPalindromicStr:tStr]) {
                if (sRet.length < tStr.length) {
                    sRet = tStr;
                }
            }
            else{
                //不是回文
                continue;
            }
        }
    }
    
    return sRet;
}

- (BOOL)isPalindromicStr:(NSString *)str{
    
    BOOL bRet = NO;
    
    int i = 0,j = str.length - 1;
    while (j - i > 0) {
        NSString *subStr1,*subStr2;
        subStr1 = [NSString stringWithFormat:@"%c",[str characterAtIndex:i]];
        subStr2 = [NSString stringWithFormat:@"%c",[str characterAtIndex:j]];
        if ([subStr1 isEqualToString:subStr2]) {
            i++;
            j--;
        }
        else{
            bRet = NO;
            break;
        }
    }
    if (j - i <= 0) {
        bRet = YES;
    }
    return bRet;
    
}


@end
