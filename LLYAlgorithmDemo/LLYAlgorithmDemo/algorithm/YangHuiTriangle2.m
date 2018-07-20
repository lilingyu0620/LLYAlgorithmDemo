//
//  YangHuiTriangle2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/20.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "YangHuiTriangle2.h"

@implementation YangHuiTriangle2{
    NSMutableArray *_array;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        [self yangHuiTriangle:5 array:_array];
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (void)yangHuiTriangle:(int)line array:(NSMutableArray *)array{
    
    [array addObject:@(1)];

    for (int i = 1; i <= line; i++) {
        
        for (int j = i; j >= 1; j--) {
            
            int pre1,pre2;
            
            pre1 = [array[j-1] intValue];

            if (j >= array.count) {
                pre2 = 0;
            }
            else{
                pre2 = [array[j] intValue];
            }
            
            int cur = pre1 + pre2;
            if (j >= array.count) {
                [array addObject:@(cur)];
            }
            else{
                array[j] = @(cur);
            }
        }
        
    }
    
}

@end
