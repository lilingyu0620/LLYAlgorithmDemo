//
//  Recurrence.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/4/2.
//  Copyright © 2018年 lly. All rights reserved.
//
//  递归

#import "Recurrence.h"

@implementation Recurrence

- (instancetype)init{
    self = [super init];
    if (self) {
        int sum = [self sum:@[@1,@2,@3,@4,@5,@6,@7] index:6];
        NSLog(@"sum = %d",sum);
        int max = [self max:@[@3,@2,@25,@4,@7,@10,@5] index:0];
        NSLog(@"max = %d",max);
        int fibonacci = [self fibonacci:10];
        NSLog(@"fibonacci = %d",fibonacci);
    }
    return self;
}

- (int)sum:(NSArray *)array index:(int)idx{
    
    static int sum = 0;
    if (idx == 0) {
        sum = [array[0] intValue];
    }
    else{
        sum = [array[idx] intValue] + [self sum:array index:idx - 1];
    }
    return sum;
}

- (int)max:(NSArray *)array index:(int)idx{
    static int max = 0;
    if (idx == array.count) {
        return max;
    }
    else{
        if (max < [array[idx] intValue]) {
            max = [array[idx] intValue];
        }
        return [self max:array index:idx + 1];
    }
    return max;
}


- (int)fibonacci:(int)num{
    if (num == 0) return 0;
    if (num == 1) return 1;
    return [self fibonacci:(num - 1)] + [self fibonacci:(num - 2)];
}

@end
