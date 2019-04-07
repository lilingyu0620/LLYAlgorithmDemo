//
//  FirstUniqueCharacter.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/4/7.
//  Copyright © 2019 lly. All rights reserved.
//


//387. First Unique Character in a String
//Easy
//
//893
//
//72
//
//Favorite
//
//Share
//Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.
//Note: You may assume the string contain only lowercase letters.
//


#import "FirstUniqueCharacter.h"

@implementation FirstUniqueCharacter

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int index = [self firstUniqueCharacter:@"leetcode"];
//        int index = [self firstUniqueCharacter:@"loveleetcode"];
        int index = [self firstUniqueCharacter:@"aaaaaaab"];
        NSLog(@"index = %d",index);
        
    }
    return self;
}

- (int)firstUniqueCharacter:(NSString *)str{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < str.length; i++) {
        
        NSString *key = [str substringWithRange:NSMakeRange(i, 1)];
        NSNumber *times = [dic objectForKey:key];
        if (!times) {
            [dic setObject:@1 forKey:key];
        }
        else{
            int time = [times intValue];
            [dic setObject:@(++time) forKey:key];
        }
        
    }
    
    for (int i = 0; i < str.length; i++) {
        
        NSString *key = [str substringWithRange:NSMakeRange(i, 1)];
        NSNumber *times = [dic objectForKey:key];
        if ([times intValue] == 1) {
            return i;
        }
    }
    
    return -1;
    
}


@end
