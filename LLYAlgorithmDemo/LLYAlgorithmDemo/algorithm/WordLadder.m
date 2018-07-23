//
//  WordLadder.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/23.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
//
//Only one letter can be changed at a time.
//Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
//Note:
//
//Return 0 if there is no such transformation sequence.
//All words have the same length.
//All words contain only lowercase alphabetic characters.
//You may assume no duplicates in the word list.
//You may assume beginWord and endWord are non-empty and are not the same.
//Example 1:
//
//Input:
//beginWord = "hit",
//endWord = "cog",
//wordList = ["hot","dot","dog","lot","log","cog"]
//
//Output: 5
//
//Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
//return its length 5.
//Example 2:
//
//Input:
//beginWord = "hit"
//endWord = "cog"
//wordList = ["hot","dot","dog","lot","log"]
//
//Output: 0
//
//Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.

#import "WordLadder.h"

@implementation WordLadder

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int lenght = [self wordLadder:@[@"hot",@"dot",@"dog",@"lot",@"log",@"cog"] startWord:@"hit" endWord:@"cog"];
        NSLog(@"length = %d",lenght);
        
    }
    return self;
}


- (int)wordLadder:(NSArray *)array startWord:(NSString *)startWord endWord:(NSString *)endWord{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    if (![endWord isEqualToString:array.lastObject]) {
        return -1;
    }
    
    [retArray addObject:startWord];
    
    NSString *tmpStr = startWord;
    for (int i = 0; i < array.count; i++) {
        
        NSString *str = array[i];
        if ([self diffCharNum:tmpStr str2:str] == 1) {
            [retArray addObject:str];
            tmpStr  = str;
        }
        
        if ([self diffCharNum:tmpStr str2:endWord] == 1) {
            [retArray addObject:endWord];
            break;
        }
    }
    
    if ([retArray.lastObject isEqualToString:endWord]) {
        return retArray.count;
    }
    else{
        return -1;
    }
}

- (int)diffCharNum:(NSString *)str1 str2:(NSString *)str2{
    
    int diffNum = 0;
    
    if (str1.length != str2.length) {
        return diffNum;
    }
    
    int i = 0;
    while (i < str1.length) {
        if ([str1 characterAtIndex:i] != [str2 characterAtIndex:i]) {
            diffNum++;
        }
        i++;
    }
    
    return diffNum;
    
}

@end
