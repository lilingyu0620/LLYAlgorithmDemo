//
//  ReverseString.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/2/15.
//  Copyright © 2019 lly. All rights reserved.
//


//344. Reverse String
//Easy
//
//650
//
//407
//
//Favorite
//
//Share
//Write a function that reverses a string. The input string is given as an array of characters char[].
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//You may assume all the characters consist of printable ascii characters.
//
//
//
//Example 1:
//
//Input: ["h","e","l","l","o"]
//Output: ["o","l","l","e","h"]
//Example 2:
//
//Input: ["H","a","n","n","a","h"]
//Output: ["h","a","n","n","a","H"]


#import "ReverseString.h"

@implementation ReverseString

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *arr = [self reverseString:@[@"h",@"e",@"l",@"l",@"o"]];
        NSArray *arr = [self reverseString:@[@"H",@"a",@"n",@"n",@"a",@"h"]];
        NSLog(@"arr = %@",arr);
        
    }
    return self;
}

- (NSArray *)reverseString:(NSArray *)array{
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    
    NSInteger i = 0,j = arr.count - 1;
    
    while (i < j) {
        id tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
        i++;
        j--;
    }
    return arr;
}

@end
