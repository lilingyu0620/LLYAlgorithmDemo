//
//  RotateArray2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/16.
//  Copyright © 2018 lly. All rights reserved.
//

#import "RotateArray2.h"

@implementation RotateArray2{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]];
        NSLog(@"array = %@",_array);
        [self rotateArray:_array step:3];
        NSLog(@"array = %@",_array);
        
    }
    return self;
}


- (void)rotateArray:(NSMutableArray *)array step:(int)step{
    
    [self reverse:array low:(array.count - step) high:(array.count - 1)];
    [self reverse:array low:0 high:(array.count - step - 1)];
    [self reverse:array low:0 high:array.count - 1];
}

- (void)reverse:(NSMutableArray *)array low:(int)low high:(int)high{
    
    int l = low,h = high;
    while (l < h) {
        id tmp = array[l];
        array[l++] = array[h];
        array[h--] = tmp;
    }
}

@end
