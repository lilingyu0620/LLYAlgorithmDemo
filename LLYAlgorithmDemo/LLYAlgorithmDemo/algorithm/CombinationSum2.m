//
//  CombinationSum2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/5.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CombinationSum2.h"

@implementation CombinationSum2{
    NSMutableArray *_array;
}


- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        
        [self combinationSum2:@[@1,@1,@2,@5,@6,@7,@10] target:8 index:0 tmpArray:[NSMutableArray array]];
        
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}


- (void)combinationSum2:(NSArray *)array target:(int)target index:(int)index tmpArray:(NSMutableArray *)tmpArray{
    
    if (target == 0) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
        return;
    }
    
    for (int i = index; i < array.count && target >= [array[i] intValue]; i++) {
        if (i > index && [array[i] intValue] == [array[i-1] intValue]) {
            continue;
        }
        [tmpArray addObject:array[i]];
        [self combinationSum2:array target:target - [array[i] intValue]  index:i+1 tmpArray:tmpArray];
        [tmpArray removeLastObject];
    }
    
    
}


@end
