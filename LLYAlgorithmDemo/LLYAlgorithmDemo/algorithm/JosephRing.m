//
//  JosephRing.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/3.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "JosephRing.h"

@implementation JosephRing

- (instancetype)init{
    
    self = [super init];
    if (self) {
        NSMutableArray *array = [self JosephRing:[NSMutableArray arrayWithArray:@[@0,@0,@0,@0,@0]] target:3];
        NSLog(@"array = %@",array);
    }
    
    return self;
}

- (NSMutableArray *)JosephRing:(NSMutableArray *)ringArray target:(int)target{
    
    int outIndex = 0,targetCount = 0,i = 0;
    NSMutableArray *arrayRet = [NSMutableArray array];
    
    while (arrayRet.count < ringArray.count) {
        if (targetCount == target) {
            [arrayRet addObject:@(outIndex)];
            ringArray[outIndex] = @1;
            targetCount = 0;
        }
        
        if (i >= ringArray.count) {
            i = 0;
        }
        
        if ([ringArray[i] intValue] == 0) {
            outIndex = i;
            targetCount++;
            i++;
        }
        else{
            i++;
        }
    }
    return arrayRet;
}

@end
