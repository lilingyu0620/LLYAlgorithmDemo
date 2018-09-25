//
//  RemoveInvalidParentheses.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/25.
//  Copyright © 2018年 lly. All rights reserved.
//

//Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
//
//Note: The input string may contain letters other than the parentheses ( and ).
//
//Example 1:
//
//Input: "()())()"
//Output: ["()()()", "(())()"]
//Example 2:
//
//Input: "(a)())()"
//Output: ["(a)()()", "(a())()"]
//Example 3:
//
//Input: ")("
//Output: [""]

#import "RemoveInvalidParentheses.h"

@implementation RemoveInvalidParentheses

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *array = [self removeInvalidParentheses:@"(()()()"];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)removeInvalidParentheses:(NSString *)str{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSMutableString *tmpStr = [NSMutableString string];
    
    int i = 0;
    while (i < str.length) {
        
        char c = [str characterAtIndex:i];
        if (c == '(') {
            i++;
            [tmpArray addObject:[NSString stringWithFormat:@"%c",c]];
            [tmpStr appendString:[NSString stringWithFormat:@"%c",c]];
        }
        else{
            
            if (tmpArray.count == 0) {
                i++;
                continue;
            }
            
            while (tmpArray.count > 0) {
                
                char cc = [str characterAtIndex:i];
                if (cc == ')') {
                    [tmpArray removeLastObject];
                    [tmpStr appendString:[NSString stringWithFormat:@"%c",cc]];
                }
                
                i++;
            }
            
        }
        
    }
    
    
    [retArray addObject:[NSString stringWithFormat:@"%@",tmpStr]];
    tmpStr = [@"" mutableCopy];

    
    i = str.length - 1;
    while (i >= 0) {
        
        char c = [str characterAtIndex:i];
        if (c == ')') {
            i--;
            [tmpArray addObject:[NSString stringWithFormat:@"%c",c]];
            [tmpStr insertString:[NSString stringWithFormat:@"%c",c] atIndex:0];
        }
        else{
            
            if (tmpArray.count == 0) {
                i--;
                continue;
            }
            
            while (tmpArray.count > 0) {
                
                char cc = [str characterAtIndex:i];
                
                if (cc == '(') {
                    [tmpArray removeLastObject];
                    [tmpStr insertString:[NSString stringWithFormat:@"%c",cc] atIndex:0];
                }
                
                i--;
            }
        }
        
    }
    
    
    [retArray addObject:[NSString stringWithFormat:@"%@",tmpStr]];
    
    return retArray;
    
}

@end
