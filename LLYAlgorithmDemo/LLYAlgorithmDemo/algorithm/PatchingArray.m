//
//  PatchingArray.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/1/11.
//  Copyright © 2019 lly. All rights reserved.
//


//Given a sorted positive integer array nums and an integer n, add/patch elements to the array such that any number in range [1, n] inclusive can be formed by the sum of some elements in the array. Return the minimum number of patches required.
//
//Example 1:
//
//Input: nums = [1,3], n = 6
//Output: 1
//Explanation:
//Combinations of nums are [1], [3], [1,3], which form possible sums of: 1, 3, 4.
//Now if we add/patch 2 to nums, the combinations are: [1], [2], [3], [1,3], [2,3], [1,2,3].
//Possible sums are 1, 2, 3, 4, 5, 6, which now covers the range [1, 6].
//So we only need 1 patch.
//Example 2:
//
//Input: nums = [1,5,10], n = 20
//Output: 2
//Explanation: The two patches can be [2, 4].
//Example 3:
//
//Input: nums = [1,2,2], n = 5
//Output: 0

#import "PatchingArray.h"

@implementation PatchingArray{
    
    NSMutableArray *_array;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
//        NSInteger patchCount = [self patchingArray:@[@1,@3] target:6];
        NSArray *subCom = [self patchingArray:@[@1,@5,@10] target:20];
//        NSArray *subCom = [self patchingArray:@[@1,@2,@4,@13,@43] target:100];
        NSLog(@"subCom = %@",subCom);
        
    }
    return self;
}

- (NSArray *)patchingArray:(NSArray *)array target:(NSInteger)target{
    
    NSMutableArray *allElementArray = [NSMutableArray array];
    for (int i = 1; i <= target; i++) {
        [allElementArray addObject:@(i)];
    }
    
    NSArray *subArray = [self subArray:allElementArray targetArray:array];
    for (int i = 1; i <= subArray.count; i++) {
        [self combinations:[NSMutableArray array] oriArray:subArray k:i index:0];
    }
    NSArray *subCombinArray = [_array mutableCopy];
    [_array removeAllObjects];
    
    
    for (int i = 1; i <= array.count; i++) {
        [self combinations:[NSMutableArray array] oriArray:array k:i index:0];
    }
    NSLog(@"%@",_array);
    
    if ([self isBingo:target]) {
        return @[];
    }else{
        for (NSArray *subCombin in subCombinArray) {
            
            NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:array];
            [tmpArray addObjectsFromArray:subCombin];
            
            for (int i = 1; i <= tmpArray.count; i++) {
                [self combinations:[NSMutableArray array] oriArray:tmpArray k:i index:0];
            }
            
            if ([self isBingo:target]) {
                return subCombin;
            }
            else{
                [_array removeAllObjects];
            }
            
        }
        
    }
    
    return @[];
}


- (void)combinations:(NSMutableArray *)array oriArray:(NSArray *)oriArray k:(int)k index:(int)index{
    
    if (array.count == k) {
        [_array addObject:[NSArray arrayWithArray:array]];
        return;
    }
    
    for (int i = index; i < oriArray.count; i++) {
        [array addObject:oriArray[i]];
        [self combinations:array oriArray:oriArray k:k index:(i + 1)];
        [array removeLastObject];
    }
    
}

- (NSInteger)arraySum:(NSArray *)array{
    
    NSInteger sum = 0;
    for (NSNumber *num in array) {
        sum += [num integerValue];
    }
    return sum;
}

- (NSInteger)setMax:(NSMutableSet *)set{
    NSInteger max = 0;
    for (NSNumber *num in set) {
        max = MAX(max, [num integerValue]);
    }
    return max;
}

- (NSArray *)subArray:(NSMutableArray *)allElementArray targetArray:(NSArray *)targetArray{
    
    NSMutableArray *subArray = [NSMutableArray array];
    for (NSNumber *num in allElementArray) {
        bool isEqual = NO;
        for (NSNumber *num1 in targetArray) {
            if ([num integerValue] == [num1 integerValue]) {
                isEqual = YES;
                break;
            }
        }
        if (!isEqual) {
            [subArray addObject:num];
        }
    }
    return subArray;
}

- (BOOL)isBingo:(NSInteger)target{
    
    NSMutableSet *set = [NSMutableSet set];
    for (NSArray *arr in _array) {
        [set addObject:@([self arraySum:arr])];
    }
    
    NSInteger max = [self setMax:set];
    if (max >= target && max == set.count) {
        return YES;
    }
    
    return NO;
}

@end
