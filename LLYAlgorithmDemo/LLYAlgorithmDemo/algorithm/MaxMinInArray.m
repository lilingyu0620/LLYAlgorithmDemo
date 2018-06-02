//
//  MaxMinInArray.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/2.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MaxMinInArray.h"

@implementation MaxMinInArray


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        NSArray *resArray = [self maxMinInArray:@[@2,@4,@5,@3,@8,@6,@3,@2,@5,@1]];
        NSLog(@"resArray = %@",resArray);
        
    }
    
    return self;
}


- (NSArray *)maxMinInArray:(NSArray *)array{
    
    int max = [array[0] intValue],min = [array[0] intValue];
    for (int i = 1; i < array.count; i++) {
        int element = [array[i] intValue];
        if (element > max) {
            max = element;
        }else if (element < min) {
            min = element;
        }
    }
    
    return @[@(max),@(min)];
    
}

@end
