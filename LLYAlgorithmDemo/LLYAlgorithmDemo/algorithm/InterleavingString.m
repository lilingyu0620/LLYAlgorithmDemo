//
//  InterleavingString.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/11.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
//
//Example 1:
//
//Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
//Output: true
//Example 2:
//
//Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
//Output: false

#import "InterleavingString.h"

@implementation InterleavingString

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        BOOL isMatch = [self interleavingString:@"aadbbcbcac" str1:@"aabcc" str2:@"dbbca"];
//        BOOL isMatch = [self interleavingString:@"aadbbbaccc" str1:@"aabcc" str2:@"dbbca"];
        NSLog(@"isMatch = %d",isMatch);
        
    }
    return self;
}


- (BOOL)interleavingString:(NSString *)targetString str1:(NSString *)str1 str2:(NSString *)str2{
    
    if (targetString.length < (str1.length + str2.length)) {
        return NO;
    }
    
    BOOL bRet = NO;
    int index1 = 0,index2 = 0,index = 0;
    BOOL isMatch = NO;
    
    for (int i = 0; i < targetString.length; i++) {
        
        while (index1 < str1.length) {
            if ([targetString characterAtIndex:index] == [str1 characterAtIndex:index1]) {
                
                NSLog(@"char = %c",[targetString characterAtIndex:index]);
                
                index++;
                index1++;
                isMatch = YES;
            }
            else{
                break;
            }
        }
        if (!isMatch) {
            
            while (index2 < str2.length) {
                if ([targetString characterAtIndex:index] == [str2 characterAtIndex:index2]) {
                    
                    NSLog(@"char = %c",[targetString characterAtIndex:index]);
                    
                    index++;
                    index2++;
                    isMatch = YES;
                }
                else{
                    break;
                }
            }
        }
        if (!isMatch) {
            break;
        }
        isMatch = NO;
    }
    
    if (index1 + index2 < targetString.length) {
        bRet = NO;
    }
    else{
        bRet = YES;
    }
    
    return bRet;
}

@end
