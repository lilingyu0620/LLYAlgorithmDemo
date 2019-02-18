//
//  ReverseVowelsString.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/2/18.
//  Copyright © 2019 lly. All rights reserved.
//

//Write a function that takes a string as input and reverse only the vowels of a string.
//
//Example 1:
//
//Input: "hello"
//Output: "holle"
//Example 2:
//
//Input: "leetcode"
//Output: "leotcede"


#import "ReverseVowelsString.h"

@implementation ReverseVowelsString

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSString *nStr = [self reverseVowelsString:@"hello"];
        NSString *nStr = [self reverseVowelsString:@"leetcode"];
        NSLog(@"nStr = %@",nStr);
        
    }
    return self;
}

- (NSString *)reverseVowelsString:(NSString *)str{
    
    NSMutableString *mStr = [NSMutableString stringWithString:str];
    
    NSInteger begin = 0,end = mStr.length - 1;
    
    while (begin < end) {
        
        if ([self isVowels:mStr index:begin] && [self isVowels:mStr index:end]) {
            
            char tmp = [mStr characterAtIndex:begin];
            [mStr replaceCharactersInRange:NSMakeRange(begin, 1) withString:[NSString stringWithFormat:@"%c",[mStr characterAtIndex:end]]];
            [mStr replaceCharactersInRange:NSMakeRange(end, 1) withString:[NSString stringWithFormat:@"%c",tmp]];
            
            begin++;
            end--;
        }
        
        if (![self isVowels:mStr index:begin]) {
            begin++;
        }
        
        if (![self isVowels:mStr index:end]) {
            end--;
        }
    }
    
    return mStr;
}

- (BOOL)isVowels:(NSString *)str index:(NSInteger)idx{
    
    char c = [str characterAtIndex:idx];
    
    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
        return YES;
    }
    
    return NO;
}


@end
