//
//  Subsets2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/8.
//  Copyright © 2018 lly. All rights reserved.
//

#import "Subsets2.h"

@implementation Subsets2{
    NSArray *_oriArray;
    NSMutableSet *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _oriArray =@[@1,@2,@1,@2];
        _array = [NSMutableSet set];
        
        [self subsets2:[NSMutableArray array] index:0];
        
        NSLog(@"_array = %@",_array);
    }
    return self;
}


- (void)subsets2:(NSMutableArray *)array index:(int)index{
    
    [_array addObject:[NSArray arrayWithArray:array]];
    
    for (int i = index; i < _oriArray.count; i++) {
        
        if (i > index && [_oriArray[i] intValue] == [_oriArray[i-1] intValue]) {
            continue;
        }
        [array addObject:_oriArray[i]];
        [self subsets2:array index:(i + 1)];
        [array removeLastObject];
    }
}

@end
