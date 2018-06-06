//
//  Permutations.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/6.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a collection of distinct integers, return all possible permutations.
//
//Example:
//
//Input: [1,2,3]
//Output:
//[
// [1,2,3],
// [1,3,2],
// [2,1,3],
// [2,3,1],
// [3,1,2],
// [3,2,1]
// ]


#import "Permutations.h"

@implementation Permutations


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        NSMutableArray *array = [self permutations:@[@1,@2,@3,@4]];
        NSLog(@"array = %@",array);
    }
    
    return self;
}


- (NSMutableArray *)permutations:(NSArray *)array{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    for (int i = 0; i < array.count; i++) {
        
        NSMutableArray *tmpArray = [NSMutableArray array];
       
        if (retArray.count <= 0) {
            for (int j = 0; j < array.count; j++) {
                [tmpArray addObject:[NSArray arrayWithObject:array[j]]];
            }
        }
        else{
            for (int j = 0; j < retArray.count; j++) {
                for (int k = 0; k < array.count; k++) {
                    NSArray *tArray = retArray[j];
//                    NSLog(@"tArray = %@",tArray);
                    if (![self numInArray:tArray num:[array[k] intValue]]) {
                        NSMutableArray *aaa = [NSMutableArray arrayWithArray:tArray];
                        [aaa addObject:array[k]];
                        [tmpArray addObject:aaa];
                    }
                }
            }
        }
        
        retArray = tmpArray;
//        NSLog(@"retArray = %@",retArray);

    }
    
    return retArray;
}

- (BOOL)numInArray:(NSArray *)array num:(int)num{
    BOOL bRet = NO;
    for (int i = 0; i < array.count; i++) {
        if ([array[i] intValue] == num) {
            bRet = YES;
            break;
        }
    }
    return bRet;
}


@end
