//
//  MoveZeroes.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/16.
//  Copyright © 2018 lly. All rights reserved.
//

#import "MoveZeroes.h"

@implementation MoveZeroes{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray arrayWithArray:@[@0,@1,@0,@3,@12]];
        
        NSLog(@"_array = %@",_array);
        
//        [self moveZeroes];
        [self moveZeroesII];
        
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (void)moveZeroes{
    
    for (int i = 0; i < _array.count; i++) {
        
        if ([_array[i] intValue] == 0) {
            for (int j = i+1; j < _array.count; j++) {
                _array[j-1] = _array[j];
            }
            _array[(_array.count - 1)] = @0;
        }
    }
    
}

- (void)moveZeroesII{
    
    int zeroCount = 0;
    //非0的元素前面有几个0就往前移几位
    for (int i = 0; i < _array.count; i++) {
        
        if ([_array[i] intValue] == 0) {
            zeroCount++;
        }
        else{
            _array[i-zeroCount] = _array[i];
        }
    }
    
    //后面补0
    while (zeroCount > 0) {
        _array[(_array.count - zeroCount)] = @0;
        zeroCount--;
    }
    
}

@end
