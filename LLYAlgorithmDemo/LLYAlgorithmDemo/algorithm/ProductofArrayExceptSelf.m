//
//  ProductofArrayExceptSelf.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/1.
//  Copyright © 2018 lly. All rights reserved.
//

#import "ProductofArrayExceptSelf.h"

@implementation ProductofArrayExceptSelf

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *array = [self productofArrayExceptSelf:@[@1,@2,@3,@4]];
        NSLog(@"array = %@",array);
    }
    return self;
}


- (NSArray *)productofArrayExceptSelf:(NSArray *)array{
    
    NSMutableArray *bArray = [NSMutableArray array];
    
    int pro = 1;
    for (id num in array) {
        pro *= [num intValue];
    }
    
    for (id num in array) {
        [bArray addObject:@(pro / [num intValue])];
    }
    
    return bArray;
    
}

@end
