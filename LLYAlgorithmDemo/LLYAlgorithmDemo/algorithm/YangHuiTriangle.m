//
//  YangHuiTriangle.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/19.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "YangHuiTriangle.h"

@implementation YangHuiTriangle{
    NSMutableArray *_array;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array = [NSMutableArray array];
        [self yangHuiTriangle:5 array:_array];
        NSLog(@"array = %@",_array);
        
    }
    return self;
}

- (void)yangHuiTriangle:(int)line array:(NSMutableArray *)array{
    
    for (int i = 0; i < line; i++) {
        
        NSMutableArray *tmp = [NSMutableArray array];
        for (int j = 0; j <= i; j++) {
            if (i == 0) {
                [tmp addObject:@1];
                break;
            }
            
            NSMutableArray *preLineArray = array[i-1];
            int pre1,pre2;
            if (j == 0) {
                pre1 = 0;
            }
            else{
                pre1 = [preLineArray[j-1] intValue];
            }
            
            if (j >= preLineArray.count) {
                pre2 = 0;
            }
            else{
                pre2 = [preLineArray[j] intValue];
            }
            
            int cur = pre1 + pre2;
            [tmp addObject:@(cur)];
        }
        
        [array addObject:tmp];
    }
}

@end
