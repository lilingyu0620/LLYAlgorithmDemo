//
//  NumberofIslands.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/17.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "NumberofIslands.h"

@implementation NumberofIslands

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int lands = [self numberofIslands:@[@[@1,@1,@1,@1,@0],@[@1,@1,@0,@1,@0],@[@1,@1,@0,@0,@0],@[@0,@0,@0,@0,@0]]];
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@1,@1,@0,@0,@0]],[NSMutableArray arrayWithArray:@[@1,@1,@0,@0,@0]],[NSMutableArray arrayWithArray:@[@0,@0,@1,@0,@0]],[NSMutableArray arrayWithArray:@[@0,@0,@0,@1,@1]],nil];
        int lands = [self numberofIslands:array];
        NSLog(@"lands = %d",lands);
        
    }
    return self;
}

- (int)numberofIslands:(NSMutableArray *)array{
    
    int lands = 0;
    
    for (int row = 0; row < array.count; row++) {
        
        NSArray *colArray = array[row];
        
        for (int col = 0; col < colArray.count; col++) {
            
            if ([self element:array row:row col:col] == 1) {
                lands++;
                [self dfs:array row:row col:col];
            }
        }
    }
    
    return lands;
}

- (int)element:(NSMutableArray *)array row:(int)row col:(int)col{
    
    if (row >= array.count || row < 0) {
        return 0;
    }
    
    NSArray *colArray = array[row];
    if (col >= colArray.count || col < 0) {
        return 0;
    }
    
    return [array[row][col] intValue];
    
}

- (void)dfs:(NSMutableArray *)array row:(int)row col:(int)col{
    
    if (row >= array.count || row < 0) {
        return;
    }
    
    NSMutableArray *colArray = array[row];
    if (col >= colArray.count || col < 0) {
        return;
    }
    
    if ([self element:array row:row col:col] == 0 || [self element:array row:row col:col] == 2){
        return;
    }
    
    if ([self element:array row:row col:col] == 1){
        colArray[col] = @(2);
    }
    
    [self dfs:array row:row col:col+1];
    [self dfs:array row:row col:col-1];
    [self dfs:array row:row+1 col:col];
    [self dfs:array row:row-1 col:col];
    
}

@end
