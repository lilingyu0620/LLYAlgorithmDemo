//
//  PalindromePartitioning.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/26.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given a string s, partition s such that every substring of the partition is a palindrome.
//
//Return all possible palindrome partitioning of s.
//
//Example:
//
//Input: "aab"
//Output:
//[
// ["aa","b"],
// ["a","a","b"]
// ]

#import "PalindromePartitioning.h"

@implementation PalindromePartitioning{
    
    NSMutableArray *_array;
    NSInteger _minCut;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        [self palindromePartitioning:@[@"a",@"a",@"b"] tmpArray:[NSMutableArray array] index:0];
        NSLog(@"array = %@",_array);
        
        _minCut = NSIntegerMax;
        NSLog(@"minCut = %ld",(long)_minCut);
        [self palindromePartitioning2:@[@"a",@"a",@"b"] tmpArray:[NSMutableArray array] index:0];
        NSLog(@"minCut = %ld",(long)_minCut);
        
        _minCut = [self dpPalindromePartitioning:@[@"a",@"a",@"b"]];
        NSLog(@"minCut = %ld",(long)_minCut);
        
    }
    return self;
}

- (void)palindromePartitioning:(NSArray *)array tmpArray:(NSMutableArray *)tmpArray index:(int)index{
    
    if (index >= array.count) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
    }
    
    for (int i = index; i < array.count; i++) {
        
        if ([self isPartitioning:array index1:index index2:i]) {
            
            if (index == i) {
                [tmpArray addObject:array[i]];
            }
            else{
                [tmpArray addObject:[array subarrayWithRange:NSMakeRange(index, i - index + 1)]];
            }
            [self palindromePartitioning:array tmpArray:tmpArray index:i+1];
            [tmpArray removeLastObject];
        }
    }
    
}

- (void)palindromePartitioning2:(NSArray *)array tmpArray:(NSMutableArray *)tmpArray index:(int)index{
    
    if (index >= array.count && tmpArray.count < _minCut) {
        _minCut = tmpArray.count;
    }
    
    for (int i = index; i < array.count; i++) {
        
        if ([self isPartitioning:array index1:index index2:i]) {
            
            if (index == i) {
                [tmpArray addObject:array[i]];
            }
            else{
                [tmpArray addObject:[array subarrayWithRange:NSMakeRange(index, i - index + 1)]];
            }
            [self palindromePartitioning2:array tmpArray:tmpArray index:i+1];
            [tmpArray removeLastObject];
        }
    }
    
}

- (int)dpPalindromePartitioning:(NSArray *)array{
    
    NSMutableArray *dpArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        [dpArray addObject:@(0)];
    }
    
    for (int start = array.count - 1; start >= 0; start--) {
        
        dpArray[start] = @(array.count - 1 - start);
        
        for (int end = start; end < array.count; end++) {
            
            if ([self isPartitioning:array index1:start index2:end]) {
                
                if (end == array.count - 1) {
                    dpArray[start] = @(0);
                }
                else{
                    dpArray[start] = @(MIN([dpArray[start] intValue], [dpArray[end+1] intValue] + 1));
                }
            }
            
        }
        
    }
    
    return [dpArray.firstObject intValue];
    
}


- (BOOL)isPartitioning:(NSArray *)array index1:(int)index1 index2:(int)index2{
    
    if (index1 == index2) {
        return YES;
    }
    int begin = index1,end = index2;
    
    while (begin < end) {
        if ([array[begin] isEqualToString:array[end]]) {
            begin++;
            end--;
        }
        else{
            return NO;
        }
    }
    
    return YES;
}

@end
