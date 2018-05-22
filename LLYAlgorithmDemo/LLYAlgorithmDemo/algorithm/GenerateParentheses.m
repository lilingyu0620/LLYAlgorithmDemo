//
//  GenerateParentheses.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/22.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
// "((()))",
// "(()())",
// "(())()",
// "()(())",
// "()()()"
// ]


#import "GenerateParentheses.h"

@implementation GenerateParentheses


- (instancetype)init{
    self = [super init];
    if (self) {
        NSMutableArray *array = [self generateParentheses:3];
        NSLog(@"array = %@",array);
    }
    return self;
}


- (NSMutableArray *)generateParentheses:(int)n{
    
    NSMutableArray *retArray = [NSMutableArray array];
    [self getGenerateParentheses:n left:0 right:0 array:retArray str:@""];
    return retArray;
}

- (void)getGenerateParentheses:(int)n left:(int)left right:(int)right array:(NSMutableArray *)array str:(NSString *)tmpStr{
    
    if (left == n && right == left) {
        [array addObject:tmpStr];
        return;
    }
    
    if (left < n) {
        [self getGenerateParentheses:n left:left + 1 right:right array:array str:[NSString stringWithFormat:@"%@(",tmpStr]];
    }
    
    if (right < left) {
        [self getGenerateParentheses:n left:left right:right + 1 array:array str:[NSString stringWithFormat:@"%@)",tmpStr]];
    }
}


@end
