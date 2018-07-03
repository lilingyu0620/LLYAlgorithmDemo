//
//  SortColors.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/30.
//  Copyright © 2018 lly. All rights reserved.
//

//
//Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
//
//Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
//
//Note: You are not suppose to use the library's sort function for this problem.
//
//Example:
//
//Input: [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]
//Follow up:
//
//A rather straight forward solution is a two-pass algorithm using counting sort.
//First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
//Could you come up with a one-pass algorithm using only constant space?


#import "SortColors.h"

@implementation SortColors

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[@2,@0,@2,@1,@1,@0]];
        NSLog(@"array = %@",array);
        [self sortColors:array];
        NSLog(@"array = %@",array);
    }
    return self;
}

- (void)sortColors:(NSMutableArray *)array{
    
    int begin = 0,end = array.count - 1;
    int current = 0;
    while (current != end) {
        if ([array[current] intValue] == 0) {
            id tmp = array[begin];
            array[begin] = array[current];
            array[current] = tmp;
            begin++;
            current++;
        }
        else if ([array[current] intValue] == 2) {
            id tmp = array[end];
            array[end] = array[current];
            array[current] = tmp;
            end--;
        }
        else{
            current++;
        }
        
    }
}

@end
