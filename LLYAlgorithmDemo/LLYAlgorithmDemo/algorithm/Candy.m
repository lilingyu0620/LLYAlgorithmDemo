//
//  Candy.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/29.
//  Copyright © 2018年 lly. All rights reserved.
//

//There are N children standing in a line. Each child is assigned a rating value.
//
//You are giving candies to these children subjected to the following requirements:
//
//Each child must have at least one candy.
//Children with a higher rating get more candies than their neighbors.
//What is the minimum candies you must give?
//
//Example 1:
//
//Input: [1,0,2]
//Output: 5
//Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
//Example 2:
//
//Input: [1,2,2]
//Output: 4
//Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
//The third child gets 1 candy because it satisfies the above two conditions.

#import "Candy.h"

@implementation Candy{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray arrayWithArray:@[@1,@1,@1,@1,@1]];
        
//        int candyCount = [self candy:@[@1,@0,@2]];
//        int candyCount = [self candy:@[@1,@2,@2]];
        int candyCount = [self candy:@[@1,@2,@3,@3,@1]];
        NSLog(@"candyCount = %ld",(long)candyCount);
        
    }
    return self;
}

- (int)candy:(NSArray *)rateAray{
    
    for (int i = 0; i < rateAray.count; i++) {
        
        if (i >= 1 && i < rateAray.count -1 && [rateAray[i] intValue] > [rateAray[i-1] intValue] && [rateAray[i] intValue] > [rateAray[i+1] intValue]) {
            _array[i] = @(MAX([_array[i-1] intValue], [_array[i+1] intValue]) + 1);
        }
        else if (i >= 1 && [rateAray[i] intValue] > [rateAray[i-1] intValue]){
            _array[i] = @([_array[i-1] intValue] + 1);
        }
        else if (i < rateAray.count -1 && [rateAray[i] intValue] > [rateAray[i+1] intValue]){
            _array[i] = @([_array[i+1] intValue] + 1);
        }
    }
    
    return [self sumArray:_array];
    
}

- (int)sumArray:(NSArray *)array{
    
    int ret = 0;
    for (id obj in array) {
        ret += [obj intValue];
    }
    return ret;
}

@end
