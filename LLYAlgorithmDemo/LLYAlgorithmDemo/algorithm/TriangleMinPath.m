//
//  TriangleMinPath.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/20.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "TriangleMinPath.h"

@implementation TriangleMinPath

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int result = [self minPathResult:@[@[@2],@[@3,@4],@[@6,@5,@7],@[@4,@1,@8,@3]]];
        NSLog(@"result = %d",result);
        
    }
    return self;
}


- (int)minPathResult:(NSArray *)array{
    
    int result = 0;
    
    for (int i = 0; i < array.count; i++) {
        NSArray *tmp = array[i];
        int min = [tmp[0] intValue];
        for (int j = 1; j < tmp.count; j++) {
            min = MIN(min, [tmp[j] intValue]);
        }
        result += min;
    }
    
    return  result;
}

@end
