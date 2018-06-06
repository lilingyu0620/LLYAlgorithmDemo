//
//  MultiplyStrings.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/6.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
//
//Example 1:
//
//Input: num1 = "2", num2 = "3"
//Output: "6"
//Example 2:
//
//Input: num1 = "123", num2 = "456"
//Output: "56088"

#import "MultiplyStrings.h"

@implementation MultiplyStrings


- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        NSString *res = [self multiplyStrings:@"123" str2:@"456"];
        NSLog(@"res = %@",res);
    }
    
    return self;
}


- (NSString *)multiplyStrings:(NSString *)str1 str2:(NSString *)str2{
    
    int num1 = [self strToInt:str1];
    int num2 = [self strToInt:str2];
    int re = num1 * num2;
    return [NSString stringWithFormat:@"%d",re];
}

- (int)strToInt:(NSString *)str{
    
    int num = 0;
    for (int i = 0; i < str.length; i++) {
        unichar c = [str characterAtIndex:i];
        int cc = [[NSString stringWithFormat:@"%c",c] intValue];
        num = num * 10 + cc;
    }
    return num;
}

@end
