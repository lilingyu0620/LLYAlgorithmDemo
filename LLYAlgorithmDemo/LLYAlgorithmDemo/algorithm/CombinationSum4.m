//
//  CombinationSum4.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/4/3.
//  Copyright © 2019 lly. All rights reserved.
//

//377. Combination Sum IV
//Medium
//
//731
//
//70
//
//Favorite
//
//Share
//Given an integer array with all positive numbers and no duplicates, find the number of possible combinations that add up to a positive integer target.
//
//Example:
//
//nums = [1, 2, 3]
//target = 4
//
//The possible combination ways are:
//(1, 1, 1, 1)
//(1, 1, 2)
//(1, 2, 1)
//(1, 3)
//(2, 1, 1)
//(2, 2)
//(3, 1)
//
//Note that different sequences are counted as different combinations.
//
//Therefore the output is 7.


#import "CombinationSum4.h"

@implementation CombinationSum4{
    NSMutableArray *_array;
    NSMutableArray *_resArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        _resArray = [NSMutableArray array];
        
        NSInteger num = [self combinationSum4:@[@1,@2,@3] target:4];
        NSLog(@"num = %ld",(long)num);
        
        [self combinationSum4:@[@1,@2,@3] tmpArray:[NSMutableArray array] target:4];
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (NSInteger)combinationSum4:(NSArray *)array target:(NSInteger)target{
    
    if (target == 0) {
        return 1;
    }
    
    NSInteger res = 0;
    for (NSInteger i = 0; i < array.count && target >= [array[i] intValue]; i++) {
        res += [self combinationSum4:array target:target-[array[i] intValue]];
    }
    
    return res;
}


- (void)combinationSum4:(NSArray *)array tmpArray:(NSMutableArray *)tmpArray target:(NSInteger)target{
    
    if (target == 0) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }
    
    for (NSInteger i = 0; i < array.count && target >= [array[i] intValue]; i++) {
        [tmpArray addObject:array[i]];
        [self combinationSum4:array tmpArray:tmpArray target:target-[array[i] integerValue]];
        [tmpArray removeLastObject];
    }
    
    return;
    
}

@end
