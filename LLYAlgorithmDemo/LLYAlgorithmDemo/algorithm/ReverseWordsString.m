//
//  ReverseWordsString.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/6.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given an input string, reverse the string word by word.
//
//Example:
//
//Input: "the sky is blue",
//Output: "blue is sky the".
//Note:
//
//A word is defined as a sequence of non-space characters.
//Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
//You need to reduce multiple spaces between two words to a single space in the reversed string.
//Follow up: For C programmers, try to solve it in-place in O(1) space.

#import "ReverseWordsString.h"

@implementation ReverseWordsString

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSMutableString *reStr = [self reverseWordsString:@"   the sky is blue   "];
        NSLog(@"reStr = %@",reStr);
        
    }
    return self;
}

- (NSMutableString *)reverseWordsString:(NSString *)oriStr{
    
    
    NSMutableString *pureStr = [NSMutableString stringWithString:[oriStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    int start = 0,end = 0;
    for (int i = 0; i <= pureStr.length; i++) {
        start = MIN(start, i);
        if (i == pureStr.length || [pureStr characterAtIndex:i] == ' ') {
            end = i-1;
            [self reverseWordsString:pureStr index1:start index2:end];
            start = i+1;
        }
    }
    
    [self reverseWordsString:pureStr index1:0 index2:pureStr.length -1];
    
    return pureStr;
    
}

- (void)reverseWordsString:(NSMutableString *)oriStr index1:(int)index1 index2:(int)index2{
    
    int start = index1;
    int end = index2;
    while (start < end) {
        
        char tmp = [oriStr characterAtIndex:start];
        [oriStr replaceCharactersInRange:NSMakeRange(start, 1) withString:[NSString stringWithFormat:@"%c",[oriStr characterAtIndex:end]]];
        [oriStr replaceCharactersInRange:NSMakeRange(end, 1) withString:[NSString stringWithFormat:@"%c",tmp]];
        start++;
        end--;
        
    }
    
}

@end
