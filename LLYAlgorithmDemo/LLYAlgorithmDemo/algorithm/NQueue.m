//
//  NQueue.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/15.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "NQueue.h"

@implementation NQueue{
    NSMutableArray *_queueArray;
    int _sum;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _queueArray = [NSMutableArray arrayWithArray:@[@-1,@-1,@-1,@-1,@-1,@-1,@-1,@-1]];
        _sum = 0;
        [self nQueue:0 n:8];
        NSLog(@"共有 %d 组值",_sum);
    }
    return self;
}

- (void)nQueue:(int)row n:(int)n {
    
    if (row == n) {
        NSLog(@"_queueArray = %@",_queueArray);
        _sum++;
    }
    else{
        for (int col = 0; col < n; col++) {
            _queueArray[row] = @(col);
            if ([self judgeQueue:_queueArray row:row]) {
                [self nQueue:row + 1 n:n];
            }
        }
    }
}


- (BOOL)judgeQueue:(NSMutableArray *)tmpArray row:(int)row{
    
    int i = 0;
    while (i < row) {
        int m = [tmpArray[i] intValue];
        int mm = [tmpArray[row] intValue];
        
        if (m == -1 || mm == -1) {
            i++;
            continue;
        }
        
        if (m == mm || abs(mm - m) == abs(i - row)) {
            return NO;
        }
        else{
            i++;
        }
    }
    return YES;
}

@end
