//
//  CombinationSum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/4.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CombinationSum.h"

@implementation CombinationSum{
    NSMutableArray *_array;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        
        [self combinationSum:@[@2,@3,@6,@7] target:7 index:0 tmpArray:[NSMutableArray array]];
        
        NSLog(@"_array = %@",_array);
    }
    return self;
}


- (void)combinationSum:(NSArray *)array target:(int)target index:(int)index tmpArray:(NSMutableArray *)tmpArray{

    if (0 == target) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }

    for (int i = index; i < array.count && target >= [array[i] intValue]; ++i) {
        [tmpArray addObject:array[i]];
        [self combinationSum:array target:target - [array[i] intValue] index:i tmpArray:tmpArray];
        [tmpArray removeLastObject];
    }
}

@end
