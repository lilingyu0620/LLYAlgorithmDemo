//
//  WordPattern.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/18.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "WordPattern.h"

@implementation WordPattern

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        BOOL isPattern = [self wordPattern:@"abba" str:@"dog cat cat dog"];
//        BOOL isPattern = [self wordPattern:@"abba" str:@"dog cat cat fish"];
//        BOOL isPattern = [self wordPattern:@"aaaa" str:@"dog cat cat dog"];
        NSLog(@"isPattern = %d",isPattern);
        
    }
    return self;
}

- (BOOL)wordPattern:(NSString *)pattern str:(NSString *)str{
    
    NSArray *strArray = [str componentsSeparatedByString:@" "];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < pattern.length; i++) {
        
        NSString *cc = [NSString stringWithFormat:@"%c",[pattern characterAtIndex:i]];
        if (![dic valueForKey:cc]) {
            [dic setValue:strArray[i] forKey:cc];
        }
        
        NSString *str = [dic valueForKey:cc];
        if (![str isEqualToString:strArray[i]]) {
            return NO;
        }
        
    }
    
    return YES;
    
}

@end
