//
//  WiggleSubsequence.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/4/1.
//  Copyright © 2019 lly. All rights reserved.
//

#import "WiggleSubsequence.h"

@implementation WiggleSubsequence

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSInteger length = [self wiggleSubsequence:@[@1,@7,@4,@9,@2,@5]];
//        NSInteger length = [self wiggleSubsequence:@[@1,@17,@5,@10,@13,@15,@10,@5,@16,@8]];
        NSInteger length = [self wiggleSubsequence:@[@1,@2,@3,@4,@5,@6,@7,@8,@9]];
        NSLog(@"length = %ld",(long)length);
        
    }
    return self;
}

- (NSInteger)wiggleSubsequence:(NSArray *)array{
    
    NSMutableArray *wiggleArray = [NSMutableArray array];
    
    NSMutableArray *p = [NSMutableArray array];
    
    for (int i = 0; i < array.count-1; i++) {
        p[i] = @([array[i+1] integerValue] - [array[i] integerValue]);
    }
    
    [wiggleArray addObject:p.firstObject];
    for (int i = 1; i < p.count; i++) {
        if ([self isAdd:wiggleArray.lastObject num2:p[i]]) {
            [wiggleArray addObject:p[i]];
        }
    }
    
    return wiggleArray.count + 1;
    
}


- (BOOL)isAdd:(NSNumber *)num1 num2:(NSNumber *)num2{
    
    NSInteger m = [num1 integerValue];
    NSInteger n = [num2 integerValue];
    
    if (m == 0 || n == 0) {
        return NO;
    }
    
    if ((m > 0 && n > 0) || (m < 0 && n < 0)) {
        return NO;
    }
    
    return YES;
}

@end
