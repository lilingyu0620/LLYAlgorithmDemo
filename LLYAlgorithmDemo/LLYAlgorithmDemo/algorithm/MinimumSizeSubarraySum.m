//
//  MinimumSizeSubarraySum.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/21.
//  Copyright © 2018 lly. All rights reserved.
//

#import "MinimumSizeSubarraySum.h"

@implementation MinimumSizeSubarraySum{
    NSInteger _arrayLength;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrayLength = NSIntegerMax;
        [self subarraySum:@[@2,@3,@1,@2,@4,@3] subArray:[NSMutableArray array] index:0 sum:7];
        NSLog(@"arraylength = %ld",(long)_arrayLength);
    }
    return self;
}


- (void)subarraySum:(NSArray *)array subArray:(NSMutableArray *)subArray index:(int)index sum:(int)sum{
    
    if ([self sumArray:subArray] >= sum) {
        _arrayLength = MIN(_arrayLength, subArray.count);
        return;
    }
    
    for (int i = 0; i < array.count; i++) {
        if ([self sumArray:subArray] < sum) {
            [subArray addObject:array[i]];
        }
        [self subarraySum:array subArray:subArray index:i+1 sum:sum];
        [subArray removeLastObject];
    }
    
}

- (int)sumArray:(NSMutableArray *)array{
    
    int ret = 0;
    for (int i = 0; i < array.count; i++) {
        ret += [array[i] intValue];
    }
    return ret;
}

@end
