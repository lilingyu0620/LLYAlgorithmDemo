//
//  WordBreak.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/31.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "WordBreak.h"

@implementation WordBreak{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        _array = [NSMutableArray arrayWithArray:@[@"leet",@"code"]];
//        BOOL canBreak = [self wordBreak2:_array str:@"leetcode"];
        
//        _array = [NSMutableArray arrayWithArray:@[@"apple",@"pen"]];
//        BOOL canBreak = [self wordBreak2:_array str:@"applepenapple"];

        _array = [NSMutableArray arrayWithArray:@[@"cats", @"dog", @"sand", @"and", @"cat"]];
        BOOL canBreak = [self wordBreak2:_array str:@"catsandog"];
        
        NSLog(@"canBreak = %d",canBreak);
        
    }
    return self;
}

- (BOOL)wordBreak2:(NSMutableArray *)array str:(NSString *)targetStr{
    
    int index = 0;
    NSString *tarStr = targetStr;
    NSMutableString *tmpStr = [NSMutableString string];
    while (index < tarStr.length) {
        
        [tmpStr appendString:[tarStr substringWithRange:NSMakeRange(index++, 1)]];
        
        if ([self strInArray:array str:tmpStr]) {
            [array removeObject:tmpStr];
            if (array.count == 0) {
                return YES;
            }
            tarStr = [tarStr substringFromIndex:index];
            index = 0;
            [tmpStr replaceCharactersInRange:NSMakeRange(0, tmpStr.length) withString:@""];
        }
        
    }
    
    if (array.count == 0) {
        return YES;
    }
    else{
        return NO;
    }
    
}

- (BOOL)strInArray:(NSMutableArray *)array str:(NSString *)str{
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isEqualToString:str]) {
            return YES;
        }
    }
    return NO;
}


@end
