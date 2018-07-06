//
//  MaximalRectangle.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/6.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
//
//Example:
//
//Input:
//[
// ["1","0","1","0","0"],
// ["1","0","1","1","1"],
// ["1","1","1","1","1"],
// ["1","0","0","1","0"]
// ]
//Output: 6


#import "MaximalRectangle.h"

@implementation MaximalRectangle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int rect = [self maximalRectangle:@[@[@1,@0,@1,@0,@0],@[@1,@0,@1,@1,@1],@[@1,@1,@1,@1,@1],@[@1,@0,@1,@1,@1]]];
        int rect = [self maximalRectangle:@[@[@1,@0,@1,@0,@0],@[@1,@0,@1,@1,@1],@[@1,@1,@1,@1,@1],@[@1,@0,@0,@1,@0]]];

        NSLog(@"rect = %d",rect);
    }
    return self;
}

- (int)maximalRectangle:(NSArray *)array{
    
    int ret = 0;
    NSMutableArray *heightArray = [NSMutableArray arrayWithArray:@[@0,@0,@0,@0,@0,@0]];
    
    for (int i = 0; i < array.count; i++) {
        
        NSArray *rowArray = array[i];
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        for (int j = 0; j < rowArray.count + 1; j++) {
            
            if (j < rowArray.count) {
                
                if ([rowArray[j] intValue] == 1) {
                    heightArray[j] = @([heightArray[j] intValue] + 1);
                }
                else{
                    heightArray[j] = @(0);
                }
                
            }
            
            if (tmpArray.count == 0 || [heightArray[[tmpArray.lastObject intValue]] intValue] <= [heightArray[j] intValue]) {
                [tmpArray addObject:@(j)];
            }
            else{
                
                while (tmpArray.count > 0 && [heightArray[[tmpArray.lastObject intValue]] intValue] > [heightArray[j] intValue]) {
                    
                    int h = [heightArray[[tmpArray.lastObject intValue]] intValue];
                    [tmpArray removeLastObject];
                    
                    int xPadding = tmpArray.count > 0 ? [tmpArray.lastObject intValue] : -1;
                    
                    if (h * (j - xPadding - 1) > ret) {
                        ret = h * (j - xPadding - 1);
                    }
                }
                [tmpArray addObject:@(j)];
            }
        }
    }
    
    return ret;
    
}

@end
