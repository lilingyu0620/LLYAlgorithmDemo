//
//  MinimumWindowSubstring.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/1.
//  Copyright © 2018 lly. All rights reserved.
//


//Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
//
//Example:
//
//Input: S = "ADOBECODEBANC", T = "ABC"
//Output: "BANC"
//Note:
//
//If there is no such window in S that covers all characters in T, return the empty string "".
//If there is such window, you are guaranteed that there will always be only one unique minimum window in S.


#import "MinimumWindowSubstring.h"

@implementation MinimumWindowSubstring

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *windowStr = [self minimumWindowSubstring:@"ADOABECODECBANC" targetStr:@"ABC"];
        NSLog(@"windowStr = %@",windowStr);
        
    }
    return self;
}


- (NSString *)minimumWindowSubstring:(NSString *)oriStr targetStr:(NSString *)targetStr{
    
    if (!oriStr || oriStr.length == 0) {
        return @"";
    }

    NSString *windowStr = oriStr;
    
    int start = 0,nextStart = 0,end = oriStr.length - 1;
    NSMutableString *tmpStr = [NSMutableString string];
    NSMutableString *tmpTargetStr = [NSMutableString string];
    BOOL nextSame = NO;
    
    while (start <= end) {
        
        if ([targetStr containsString:[NSString stringWithFormat:@"%c",[oriStr characterAtIndex:start]]]){
            
            if(![tmpTargetStr containsString:[NSString stringWithFormat:@"%c",[oriStr characterAtIndex:start]]]){
                [tmpTargetStr appendString:[NSString stringWithFormat:@"%c",[oriStr characterAtIndex:start]]];
            }
            
            if (!nextSame) {
                nextSame = YES;
            }
            else if(nextStart == 0){
                nextStart = start;
            }
        }
        
        [tmpStr appendString:[NSString stringWithFormat:@"%c",[oriStr characterAtIndex:start]]];
        
        start++;
        
        if (tmpTargetStr.length == targetStr.length) {
            if (windowStr.length > tmpStr.length){
                windowStr = [NSString stringWithFormat:@"%@",tmpStr];
            }
            start = nextStart;
            nextStart = 0;
            nextSame = NO;
            [tmpStr deleteCharactersInRange:NSMakeRange(0, tmpStr.length)];
            [tmpTargetStr deleteCharactersInRange:NSMakeRange(0, tmpTargetStr.length)];
            continue;
        }
    }
    
    return windowStr;
}

@end
