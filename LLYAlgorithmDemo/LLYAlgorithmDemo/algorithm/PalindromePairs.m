//
//  PalindromePairs.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/1/24.
//  Copyright © 2019 lly. All rights reserved.
//

//Given a list of unique words, find all pairs of distinct indices (i, j) in the given list, so that the concatenation of the two words, i.e. words[i] + words[j] is a palindrome.
//
//Example 1:
//
//Input: ["abcd","dcba","lls","s","sssll"]
//Output: [[0,1],[1,0],[3,2],[2,4]]
//Explanation: The palindromes are ["dcbaabcd","abcddcba","slls","llssssll"]
//Example 2:
//
//Input: ["bat","tab","cat"]
//Output: [[0,1],[1,0]]
//Explanation: The palindromes are ["battab","tabbat"]

#import "PalindromePairs.h"

@implementation PalindromePairs

- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSArray *array = [self palindromePairs:@[@"abcd",@"dcba",@"lls",@"s",@"sssll"]];
        NSArray *array = [self palindromePairs:@[@"bat",@"tab",@"cat"]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)palindromePairs:(NSArray *)wordsArray{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    for (int i = 0; i < wordsArray.count; i++) {
        
        for (int j = i+1; j < wordsArray.count; j++) {
            
            NSString *str1 = [NSString stringWithFormat:@"%@%@",wordsArray[i],wordsArray[j]];
            if ([self isPalindromePairs:str1]) {
                [retArray addObject:@[@(i),@(j)]];
            }
            
            NSString *str2 = [NSString stringWithFormat:@"%@%@",wordsArray[j],wordsArray[i]];
            if ([self isPalindromePairs:str2]) {
                [retArray addObject:@[@(j),@(i)]];
            }
        }
        
    }
    
    return retArray;
}

- (BOOL)isPalindromePairs:(NSString *)str{
    
    NSInteger i = 0,j = str.length - 1;
    while (j > i) {
        if ([str characterAtIndex:i] == [str characterAtIndex:j]) {
            i++;
            j--;
        }
        else{
            return NO;
        }
    }
    return YES;
    
}

@end
