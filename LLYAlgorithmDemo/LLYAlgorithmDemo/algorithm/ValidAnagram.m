//
//  ValidAnagram.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/8.
//  Copyright © 2018 lly. All rights reserved.
//

#import "ValidAnagram.h"

@implementation ValidAnagram

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        bool anagram = [self validAnagram:@"anavram" t:@"nagaram"];
        NSLog(@"anagram = %d",anagram);
    }
    return self;
}


- (bool)validAnagram:(NSString *)s t:(NSString *)t{
    
    bool bRet = NO;
    
    if (s.length != t.length) {
        return bRet;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < t.length; i++) {
        [array addObject:[NSString stringWithFormat:@"%c",[t characterAtIndex:i]]];
    }
    
    for (int i = 0; i < s.length; i++) {
        
        NSString *c = [NSString stringWithFormat:@"%c",[s characterAtIndex:i]];
        NSInteger index = [array indexOfObject:c];
        if (index != NSNotFound) {
            [array removeObjectAtIndex:index];
        }else{
            return bRet;
        }
        
    }
    
    if (array.count == 0) {
        bRet = YES;
    }
    
    
    return bRet;
}

@end
