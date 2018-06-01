//
//  LongestValidParentheses.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/1.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "LongestValidParentheses.h"


//Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//
//Example 1:
//
//Input: "(()"
//Output: 2
//Explanation: The longest valid parentheses substring is "()"
//Example 2:
//
//Input: ")()())"
//Output: 4
//Explanation: The longest valid parentheses substring is "()()"

@implementation LongestValidParentheses

- (instancetype)init{
    self = [super init];
    if (self) {
        
        int length = [self longestValidParentheses:@"(()"];
        NSLog(@"length = %d",length);
        
    }
    return self;
}

- (int)longestValidParentheses:(NSString *)parenthesesStr{
    
    int retLength = 0;
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (int i = 0; i < parenthesesStr.length; i++) {
        
        unichar c = [parenthesesStr characterAtIndex:i];
        
        if (c == '(') {
            [tmpArray addObject:[NSString stringWithFormat:@"%c",c]];
        }
        else if(c == ')'){
            
            if (tmpArray.count == 0) {
                continue;
            }
            
            [tmpArray removeLastObject];
            retLength += 2;
        }
    }
    
    
    return retLength;
}


@end
