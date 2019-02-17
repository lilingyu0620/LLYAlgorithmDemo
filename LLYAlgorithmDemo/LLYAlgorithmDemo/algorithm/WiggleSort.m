//
//  WiggleSort.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/11/22.
//  Copyright © 2018 lly. All rights reserved.
//

#import "WiggleSort.h"

@implementation WiggleSort

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSMutableArray *array = [self wiggleSort:[NSMutableArray arrayWithArray:@[@1,@1,@1,@4,@5,@6]]];
        NSMutableArray *array = [self wiggleSort:[NSMutableArray arrayWithArray:@[@1,@1,@2,@2,@3,@3]]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}


- (NSMutableArray *)wiggleSort:(NSMutableArray *)array{
    
    int min = 0,max = array.count/2;
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    while (max < array.count) {
        [tmpArray addObject:array[min++]];
        [tmpArray addObject:array[max++]];
    }

    return tmpArray;
}

@end
