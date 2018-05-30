//
//  ValidParentheses.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/30.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ValidParentheses.h"
//
//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.
//
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true

@implementation ValidParentheses


- (instancetype)init{
    self = [super init];
    if (self) {
        BOOL isValid = [self validParentheses:@"[()]}"];
        NSLog(@"isValid = %d",isValid);
    }
    return self;
}


- (BOOL)validParentheses:(NSString *)str{
    
    BOOL bRet = NO;
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (int i = 0; i < str.length; i++) {
        
        unichar c = [str characterAtIndex:i];
        
        if (c == '(' || c == '[' || c == '{') {
            [tmpArray addObject:[NSString stringWithFormat:@"%c",c]];
        }
        else{
            
            NSString *cc = [tmpArray lastObject];
            if ([self isCouple:cc str2:[NSString stringWithFormat:@"%c",c]]) {
                [tmpArray removeLastObject];
                continue;
            }
            else{
                return NO;
            }
        }
    }
    
    if (tmpArray.count == 0) {
        bRet =  YES;
    }
    
    return bRet;
}


- (BOOL)isCouple:(NSString *)str1 str2:(NSString *)str2{
    
    if ([str1 isEqualToString:@"("] && [str2 isEqualToString:@")"]) {
        return YES;
    }
    else if ([str1 isEqualToString:@"["] && [str2 isEqualToString:@"]"]){
        return YES;
    }
    else if ([str1 isEqualToString:@"{"] && [str2 isEqualToString:@"}"]){
        return YES;
    }
    return NO;
}

@end
