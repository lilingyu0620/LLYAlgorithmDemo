//
//  MaximumProductWordLengths.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/10/25.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MaximumProductWordLengths.h"

@implementation MaximumProductWordLengths

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSTimeInterval startTime = CFAbsoluteTimeGetCurrent();
        
        int maxLenght = [self maximumProductWordLengths:@[@"abcw",@"baz",@"foo",@"bar",@"xtfn",@"abcdef"]];
//        int maxLenght = [self maximumProductWordLengths:@[@"a",@"ab",@"abc",@"d",@"cd",@"bcd",@"abcd"]];
//        int maxLenght = [self maximumProductWordLengths:@[@"a",@"aa",@"aaa",@"aaaa"]];
        NSLog(@"maxLenght = %d",maxLenght);
        
        NSTimeInterval endTime = CFAbsoluteTimeGetCurrent();
        
        NSLog(@"run time = %f ms",(endTime-startTime)*1000);
        
    }
    return self;
}

- (int)maximumProductWordLengths:(NSArray *)array{
    
    int iMax = 0;
    
    for (int i = 0; i < array.count; i++) {
        
        NSString *str1 = array[i];
        
        for (int j = i+1; j < array.count; j++) {
            
            NSString *str2 = array[j];
            
            if (![self hasCommonLetter:str1 str2:str2]) {
                
                iMax = MAX(iMax, str1.length * str2.length);
                
            }
            
        }
        
    }
    
    return iMax;
    
}

- (BOOL)hasCommonLetter:(NSString *)str1 str2:(NSString *)str2{
    
    
    for (int i = 0; i < str1.length; i++) {
        
        char c1 = [str1 characterAtIndex:i];
        
        for (int j = 0; j < str2.length; j++) {
            
            char c2 = [str2 characterAtIndex:j];
            
            if (c1 == c2) {
                
                return YES;
                
            }
        }
        
    }
    
    return NO;
    
}

@end
