//
//  SurroundedRegions.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/25.
//  Copyright © 2018年 lly. All rights reserved.
//

//
//Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
//
//A region is captured by flipping all 'O's into 'X's in that surrounded region.
//
//Example:
//
//X X X X
//X O O X
//X X O X
//X O X X
//After running your function, the board should be:
//
//X X X X
//X X X X
//X X X X
//X O X X
//Explanation:
//
//Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.

#import "SurroundedRegions.h"

@implementation SurroundedRegions


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[[NSMutableArray arrayWithArray:@[@"X",@"X",@"X",@"X"]],[NSMutableArray arrayWithArray:@[@"X",@"O",@"O",@"X"]],[NSMutableArray arrayWithArray:@[@"X",@"X",@"O",@"X"]],[NSMutableArray arrayWithArray:@[@"X",@"O",@"X",@"X"]]]];
        
        NSLog(@"array = %@",array);
        [self surroundedRegions:array];
        NSLog(@"array = %@",array);
    }
    return self;
}

- (void)surroundedRegions:(NSMutableArray *)array{
    
    
    //第一行和最后一行不需要变
    for (int i = 1; i < array.count - 1; i++) {
        
        NSMutableArray *tmpArray = array[i];
        
        //第一列和最后一列不需要变
        for (int j = 1; j < tmpArray.count - 1; j++) {
            
            if ([tmpArray[j] isEqualToString:@"O"] && [self hasSurround:array x:i y:j]) {
                tmpArray[j] = @"X";
            }
        }
        
    }
    
}

- (BOOL)hasSurround:(NSMutableArray *)array x:(int)x y:(int)y{
    
    //x表示行坐标 y表示列坐标
    NSMutableArray *xArray = array[x];
    NSMutableArray *yArray = [NSMutableArray array];
    
    for (int i = 0;i < array.count; i++) {
        NSMutableArray *tmpArray = array[i];
        [yArray addObject:tmpArray[y]];
    }
    
    return [self findX:xArray index:x] && [self findX:yArray index:y];
    
}

- (BOOL)findX:(NSMutableArray *)array index:(int)index{
    
    int begin = 0,end = array.count - 1;
    
    while (begin < index && end > index) {
        if ([array[begin] isEqualToString:@"X"] && [array[end] isEqualToString:@"X"]) {
            return YES;
        }
        
        if ([array[begin] isEqualToString:@"X"]) {
            end--;
            continue;
        }
        
        if ([array[end] isEqualToString:@"X"]) {
            begin++;
            continue;
        }
    }
    
    return NO;
    
}


@end
