//
//  MaximumProductSubarray.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/7.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MaximumProductSubarray.h"

@implementation MaximumProductSubarray

- (instancetype)init
{
    self = [super init];
    if (self) {
//        int max = [self maximumProductSubarray:@[@2,@3,@-2,@4,@5]];
//        int max = [self maximumProductSubarray:@[@-2,@0,@1]];
        int max = [self maximumProductSubarray:@[@-2,@-4]];
        NSLog(@"max = %d",max);
    }
    return self;
}

- (int)maximumProductSubarray:(NSArray *)array{
    
    int r = [array[0] intValue];
    int imax = r;
    int imin = r;
    for (int i = 1; i < array.count; i++) {
        if ([array[i] intValue] < 0) {
            int tmp = imax;
            imax = imin;
            imin = tmp;
        }
        
        imax = MAX([array[i] intValue] * imax, [array[i] intValue]);
        imin = MIN([array[i] intValue] * imin, [array[i] intValue]);
        
        r = MAX(r, imax);
       
    }
    return r;
}

@end
