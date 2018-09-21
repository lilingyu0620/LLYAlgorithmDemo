//
//  LongestIncreasingSubsequence.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/21.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "LongestIncreasingSubsequence.h"

@implementation LongestIncreasingSubsequence

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int longest = [self longestIncreasingSubsequence:@[@10,@9,@2,@5,@3,@4]];
//        int longest = [self longestIncreasingSubsequence:@[@10,@9,@2,@5,@3,@7,@101,@1]];
        int longest = [self longestIncreasingSubsequence:@[@1,@3,@6,@7,@9,@4,@10,@5,@6]];
        NSLog(@"longest = %d",longest);
        
    }
    return self;
}


- (int)longestIncreasingSubsequence:(NSArray *)array{
    
   
    int maxLen = 1;
    
    NSMutableArray *dp = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        [dp addObject:@(1)];
    }
    
    for (int i = 1; i < array.count; i++) {
        
        for (int j = 0; j < i; j++) {
            
            if ([array[i] intValue] > [array[j] intValue]) {
                dp[i] = MAX(dp[i], @([dp[j] intValue] + 1));
            }
            
        }
        
        maxLen = MAX(maxLen, [dp[i] intValue]);
    }
    
    return maxLen;
}

@end
