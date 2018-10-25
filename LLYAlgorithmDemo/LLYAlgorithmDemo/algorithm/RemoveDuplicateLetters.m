//
//  RemoveDuplicateLetters.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/10/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "RemoveDuplicateLetters.h"

@implementation RemoveDuplicateLetters

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *str = [self removeDuplicateLetters:@"cbacdcbc"];
//        NSString *str = [self removeDuplicateLetters:@"bcabc"];
        NSLog(@"str = %@",str);
        
    }
    return self;
}

- (NSString *)removeDuplicateLetters:(NSString *)originStr{
    
    NSMutableString *mutableStr = [NSMutableString string];
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < originStr.length; i++) {
        
        NSString *c = [NSString stringWithFormat:@"%c",[originStr characterAtIndex:i]];
        
        NSUInteger idx = [array indexOfObject:c];
        if (idx == NSNotFound) {
            [array addObject:c];
        }else{
            
            if (idx < array.count-1) {
                
                NSString *firstChar = array.firstObject;
                NSString *nextChar = array[idx+1];
                if ([c characterAtIndex:0] > [nextChar characterAtIndex:0] || [c characterAtIndex:0] == [firstChar characterAtIndex:0]) {
                    [array removeObject:c];
                    [array addObject:c];
                }
                
            }
        }
    }
    
    for (int i = 0; i < array.count; i++) {
        [mutableStr appendString:array[i]];
    }
    
    return mutableStr;
}

@end
