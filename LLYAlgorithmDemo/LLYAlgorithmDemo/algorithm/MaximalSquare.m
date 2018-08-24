//
//  MaximalSquare.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MaximalSquare.h"

@implementation MaximalSquare

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@1,@0,@1,@1,@1]],[NSMutableArray arrayWithArray:@[@1,@0,@1,@0,@1]],[NSMutableArray arrayWithArray:@[@1,@1,@1,@1,@1]],[NSMutableArray arrayWithArray:@[@1,@0,@0,@1,@0]], nil];

        int sz = [self maximalSquare:array];
        NSLog(@"sz = %d",sz);
        
    }
    return self;
}

- (int)maximalSquare:(NSArray *)matrix{
    
    NSMutableArray *dp = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@1,@0,@1,@1,@1]],[NSMutableArray arrayWithArray:@[@1,@0,@0,@0,@0]],[NSMutableArray arrayWithArray:@[@1,@0,@0,@0,@0]],[NSMutableArray arrayWithArray:@[@1,@0,@0,@0,@0]], nil];
    
    int sz = 1;
    
    for (int i = 1; i < matrix.count; i++) {
        
        NSMutableArray *tmpArray = matrix[i];
        for (int j = 1; j < tmpArray.count; j++) {
            if ([matrix[i][j] intValue] == 1) {
                dp[i][j] = @(MIN([dp[i-1][j-1] intValue], MIN([dp[i][j-1] intValue], [dp[i-1][j] intValue])) + 1);
                sz = MAX(sz, [dp[i][j] intValue]);
            }
        }
    }
    
    return sz * sz;
    
}

@end
