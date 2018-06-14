//
//  GroupAnagrams.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/14.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given an array of strings, group anagrams together.
//
//Example:
//
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output:
//[
// ["ate","eat","tea"],
// ["nat","tan"],
// ["bat"]
// ]
//Note:
//
//All inputs will be in lowercase.
//The order of your output does not matter.



#import "GroupAnagrams.h"

@implementation GroupAnagrams

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        NSMutableArray *array = [self groupAnagrams:@[@"eat",@"tea",@"tan",@"ate",@"nat",@"bat"]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSMutableArray *)groupAnagrams:(NSArray *)array{
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    BOOL inSubStr = NO;
    for (NSString *str in array) {
        for (NSMutableArray *array in mutableArray) {
            NSString *subStr = array.firstObject;
            if ([self strEqualStr:str str2:subStr]) {
                [array addObject:str];
                inSubStr = YES;
                break;
            }
        }
        
        if (!inSubStr) {
            [mutableArray addObject:[NSMutableArray arrayWithObject:str]];
        }
        
        inSubStr = NO;
    }
    return mutableArray;
}

- (BOOL)strEqualStr:(NSString *)str1 str2:(NSString *)str2{
    
    if (str1.length != str2.length) {
        return NO;
    }
    
    int sameCount = 0;
    
    for (int i = 0; i < str1.length; i++) {
        NSString *charStr = [NSString stringWithFormat:@"%c",[str1 characterAtIndex:i]];
        if ([self strInStr:charStr str:str2]) {
            sameCount++;
        }
        else{
            return NO;
        }
    }
    
    if (sameCount == str1.length) {
        return YES;
    }
    else{
        return NO;
    }
}

- (BOOL)strInStr:(NSString *)charStr str:(NSString *)str{
    for (int j = 0; j < str.length; j++) {
        NSString *charStr2 = [NSString stringWithFormat:@"%c",[str characterAtIndex:j]];
        if ([charStr isEqualToString:charStr2]) {
            return YES;
        }
    }
    return NO;
}





@end
