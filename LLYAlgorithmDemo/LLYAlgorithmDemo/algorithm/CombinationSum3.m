//
//  CombinationSum3.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/23.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CombinationSum3.h"

@implementation CombinationSum3{
    NSMutableArray *_array;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        [self combinationSum3:@[@1,@2,@3,@4,@5,@6,@7,@8,@9] tmpArray:[NSMutableArray array] target:9 k:3 index:0];
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (void)combinationSum3:(NSArray *)array tmpArray:(NSMutableArray *)tmpArray target:(int)target k:(int)k index:(int)index{
    
    if (target == 0 && tmpArray.count == k) {
        [_array addObject:[NSArray arrayWithArray:tmpArray]];
    }
    
    for (int i = index; i < array.count &&  target >= [array[i] intValue]; i++) {
        [tmpArray addObject:array[i]];
        [self combinationSum3:array tmpArray:tmpArray target:target-[array[i] intValue] k:k index:i+1];
        [tmpArray removeLastObject];
    }
    
}

@end
