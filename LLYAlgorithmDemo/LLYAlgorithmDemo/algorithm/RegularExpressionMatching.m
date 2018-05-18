//
//  RegularExpressionMatching.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/18.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
//
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).
//
//Note:
//
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like . or *.
//Example 1:
//
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//
//Input:
//s = "aa"
//p = "a*"
//Output: true
//Explanation: '*' means zero or more of the precedeng element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
//Example 3:
//
//Input:
//s = "ab"
//p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
//Example 4:
//
//Input:
//s = "aab"
//p = "c*a*b"
//Output: true
//Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore it matches "aab".
//Example 5:
//
//Input:
//s = "mississippi"
//p = "mis*is*p*."
//Output: false

#import "RegularExpressionMatching.h"

@implementation RegularExpressionMatching

- (instancetype)init{
    self = [super init];
    if (self) {
        BOOL isMatch = [self isMatch:@"mississippi" matchStr:@"mis*is*p*."];
        NSLog(@"isMatch = %d",isMatch);
    }
    return self;
}


//我们先来判断p是否为空，若为空则根据s的为空的情况返回结果。当p的第二个字符为*号时，由于*号前面的字符的个数可以任意，可以为0，那么我们先用递归来调用为0的情况，就是直接把这两个字符去掉再比较，或者当s不为空，且第一个字符和p的第一个字符相同时，我们再对去掉首字符的s和p调用递归，注意p不能去掉首字符，因为*号前面的字符可以有无限个；如果第二个字符不为*号，那么我们就老老实实的比较第一个字符，然后对后面的字符串调用递归，

- (BOOL)isMatch:(NSString *)sss matchStr:(NSString *)ppp{
    
    if (ppp.length == 0) {
        return sss.length == 0;
    }
    
    if (ppp.length > 1 && [ppp characterAtIndex:1] == '*') {
        return [self isMatch:sss matchStr:[ppp substringFromIndex:2]] || (sss.length > 0 && ([sss characterAtIndex:0] == [ppp characterAtIndex:0] || [ppp characterAtIndex:0] == '.') && [self isMatch:[sss substringFromIndex:1] matchStr:ppp]);
    }
    else{
        return sss.length > 0 && ([sss characterAtIndex:0] == [ppp characterAtIndex:0] || [ppp characterAtIndex:0] == '.') && [self isMatch:[sss substringFromIndex:1] matchStr:[ppp substringFromIndex:1]];
    }
    
}

//这种硬比太难了。还是使用递归比较好
//- (BOOL)isMatch:(NSString *)sss matchStr:(NSString *)ppp{
//
//    BOOL bRet = NO;
//
//    if (NSOrderedSame == [sss compare:ppp]) {
//        bRet = YES;
//        return bRet;
//    }
//
//    int sIndex = 0,pIndex = 0;
//    while (sIndex < sss.length && pIndex < ppp.length) {
//
//        unichar s = [sss characterAtIndex:sIndex];
//        unichar p = [ppp characterAtIndex:pIndex];
//        if (s == p) {
//            sIndex++;
//            pIndex++;
//        }
//        else{
//            //.*的情况
//
//            if (p == '.') {
//                if ([ppp characterAtIndex:pIndex+1] == '*') {
//                    //.*后面没有字符了
//                    if (pIndex + 1 == ppp.length - 1) {
//                        bRet = YES;
//                        break;
//                    }
//                    else{
//                        //.*有字符
//
//                    }
//                }
//                else{
//                    sIndex++;
//                    pIndex++;
//                    continue;
//                }
//            }
//
//            if (pIndex + 1 == ppp.length - 1) {
//                if (p == '.') {
//                    if ([ppp characterAtIndex:pIndex+1] == '*') {
//                        bRet = YES;
//                        break;
//                    }
//                }
//                else{
//
//                }
//            }
//
//            bRet = NO;
//            return bRet;
//        }
//    }
//
//    return bRet;
//}


@end
