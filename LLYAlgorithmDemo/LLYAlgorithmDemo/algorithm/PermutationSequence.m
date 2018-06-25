//
//  PermutationSequence.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/24.
//  Copyright © 2018 lly. All rights reserved.
//

//
//The set [1,2,3,...,n] contains a total of n! unique permutations.
//
//By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
//
//"123"
//"132"
//"213"
//"231"
//"312"
//"321"
//Given n and k, return the kth permutation sequence.
//
//Note:
//
//Given n will be between 1 and 9 inclusive.
//Given k will be between 1 and n! inclusive.
//Example 1:
//
//Input: n = 3, k = 3
//Output: "213"
//Example 2:
//
//Input: n = 4, k = 9
//Output: "2314"
//

#import "PermutationSequence.h"

@implementation PermutationSequence{
    NSMutableArray *_resArray;
    NSMutableArray *_oriArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *sequence = [self permutationSequence:4 index:9];
        NSLog(@"sequence =  %@",sequence);
        
    }
    return self;
}

- (NSArray *)permutationSequence:(int)n index:(int)k{
    
    _resArray = [NSMutableArray array];
    _oriArray = [NSMutableArray array];
    for (int i = 1; i <= n; i++) {
        [_oriArray addObject:@(i)];
    }
    
    [self permutation:_oriArray targetIndex:0];
    NSLog(@"_resArray = %@",_resArray);
    
    return _resArray[k - 1];
}


- (void)permutation:(NSMutableArray *)array targetIndex:(int)index{
    
    if (index == array.count - 1) {
        [_resArray addObject:[NSArray arrayWithArray:array]];
        return;
    }
    
    for (int i = index; i < array.count; i++) {
        
        [self swap:array index1:i index2:index];
        
        [self permutation:array targetIndex:(index + 1)];
        
        [self swap:array index1:i index2:index];
        
    }
    
}

- (void)swap:(NSMutableArray *)tmpArray index1:(int)index1 index2:(int)index2{
    
    id tmp = tmpArray[index1];
    tmpArray[index1] = tmpArray[index2];
    tmpArray[index2] = tmp;
    
}


@end
