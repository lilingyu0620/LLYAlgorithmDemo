//
//  NumberofDigitOne.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/29.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "NumberofDigitOne.h"

@implementation NumberofDigitOne

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *array = [self numberofDigitOne:130];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)numberofDigitOne:(int)n{
    
    NSMutableArray *bArray = [NSMutableArray array];
    
    for (int i = 1; i <= n; i++) {
        if ([self hasDigitOne:i]) {
            [bArray addObject:@(i)];
        }
    }
    
    return bArray;
}

- (BOOL)hasDigitOne:(int)num{
    
    if (num == 1) {
        return YES;
    }
    
    int div = 0;
    while (num >= 10) {
        div = num % 10;
        if (div == 1) {
            return YES;
        }
        num /= 10;
    }
    
    return num == 1;
}

@end
