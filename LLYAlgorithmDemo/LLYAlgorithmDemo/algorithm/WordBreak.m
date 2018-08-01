//
//  WordBreak.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/31.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.
//
//Note:
//
//The same word in the dictionary may be reused multiple times in the segmentation.
//You may assume the dictionary does not contain duplicate words.
//Example 1:
//
//Input:
//s = "catsanddog"
//wordDict = ["cat", "cats", "and", "sand", "dog"]
//Output:
//[
// "cats and dog",
// "cat sand dog"
// ]
//Example 2:
//
//Input:
//s = "pineapplepenapple"
//wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
//Output:
//[
// "pine apple pen apple",
// "pineapple pen apple",
// "pine applepen apple"
// ]
//Explanation: Note that you are allowed to reuse a dictionary word.
//Example 3:
//
//Input:
//s = "catsandog"
//wordDict = ["cats", "dog", "sand", "and", "cat"]
//Output:
//[]

#import "WordBreak.h"

@implementation WordBreak{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        _array = [NSMutableArray arrayWithArray:@[@"leet",@"code"]];
//        BOOL canBreak = [self wordBreak:_array str:@"leetcode"];
        
//        _array = [NSMutableArray arrayWithArray:@[@"apple",@"pen"]];
//        BOOL canBreak = [self wordBreak:_array str:@"applepenapple"];

//        _array = [NSMutableArray arrayWithArray:@[@"cats", @"dog", @"sand", @"and", @"cat"]];
//        BOOL canBreak = [self wordBreak:_array str:@"catsandog"];
        
//        NSLog(@"canBreak = %d",canBreak);
        
        _array = [NSMutableArray array];
        [self wordBreak2:@[@"apple",@"pen",@"applepen",@"pine",@"pineapple"] tmpArray:[NSMutableArray array] targetStr:@"pineapplepenapple" index:0];
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (BOOL)wordBreak:(NSMutableArray *)array str:(NSString *)targetStr{
    
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

//- (NSMutableArray *)wordBreak2:(NSMutableArray *)array str:(NSString *)targetStr{
//
//    NSMutableArray *retArray = [NSMutableArray array];
//    NSMutableArray *tmpArray = [NSMutableArray array];
//    int index = 0;
//    NSMutableString *tmpStr = [NSMutableString string];
//    while (index < targetStr.length) {
//        [tmpStr appendString:[targetStr substringWithRange:NSMakeRange(index++, 1)]];
//        if ([self strInArray:array str:tmpStr]) {
//            [tmpArray addObject:[NSString stringWithFormat:@"%@",tmpStr]];
//        }
//    }
//
//
//
//    return retArray;
//
//}

- (void)wordBreak2:(NSArray *)array tmpArray:(NSMutableArray *)tmpArray targetStr:(NSString *)targetStr index:(int)index{
    
    if (index >= targetStr.length) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
    }
    
    for (int i = index; i < targetStr.length; i++) {
        
        if ([self strInArray2:array targetStr:targetStr index1:index index2:i]) {
            [tmpArray addObject:[targetStr substringWithRange:NSMakeRange(index, i-index+1)]];
            [self wordBreak2:array tmpArray:tmpArray targetStr:targetStr index:i+1];
            [tmpArray removeLastObject];
        }
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

- (BOOL)strInArray2:(NSArray *)array targetStr:(NSString *)targetStr index1:(int)index1 index2:(int)index2{
    
    NSString *str = [targetStr substringWithRange:NSMakeRange(index1, index2-index1+1)];
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isEqualToString:str]) {
            return YES;
        }
    }
    return NO;
}



@end
