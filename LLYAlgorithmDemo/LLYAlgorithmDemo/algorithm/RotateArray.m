//
//  RotateArray.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/15.
//  Copyright © 2018 lly. All rights reserved.
//

#import "RotateArray.h"

@implementation RotateArray{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]];
        NSLog(@"array = %@",_array);
        [self rotateArray:_array step:4];
        NSLog(@"array = %@",_array);
    }
    return self;
}


- (void)rotateArray:(NSMutableArray *)array step:(int)step{
    
    int index = 0;
    int count = 0;
    while (index < step) {
        int padding = index;
        id p = array[padding];
        padding = (step + padding) % array.count ;
        id q = array[padding];
        while (padding != index) {
            q = array[padding];
            array[padding] = p;
            p = q;
            count++;
            padding = (step + padding) % array.count ;
        }
        array[padding] = p;
        count++;
        if (count == array.count) {
            return;
        }
        index++;
    }
}


@end
