//
//  Permutations2.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/7.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given a collection of numbers that might contain duplicates, return all possible unique permutations.
//
//Example:
//
//Input: [1,1,2]
//Output:
//[
// [1,1,2],
// [1,2,1],
// [2,1,1]
// ]

#import "Permutations2.h"

@implementation Permutations2{
    
    NSMutableArray *_oriArray;
    NSMutableArray *_resArray;
    
}


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _oriArray = [NSMutableArray arrayWithArray:@[@1,@1,@2]];
        _resArray = [NSMutableArray array];
        
//        NSMutableArray *array = [self permutations:@[@1,@1,@2]];
//        NSLog(@"array = %@",array);

        [self recursion:_oriArray index:0];
        NSLog(@"_resArray = %@",_resArray);
    }
    
    return self;
}


- (void)recursion:(NSMutableArray *)array index:(int)i{
    
    if (i == array.count - 1) {
        
        if (![self arrayInArray:_resArray subArray:array]) {
            [_resArray addObject:[NSArray arrayWithArray:array]];
        }
        return;
    }
    
    for (int k = i; k < array.count; k++) {
        
        if (i != k && [array[i] intValue] == [array[k] intValue]) {
            continue;
        }
        
        [self swap:array i:i j:k];
        
        [self recursion:array index:(i + 1)];
    }
}


- (void)swap:(NSMutableArray *)array i:(int)i j:(int)j{
    
    id tmp = array[i];
    array[i] = array[j];
    array[j] = tmp;
    
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
                for (int k = 0; k < array.count ; k++) {
                    
                    NSArray *tArray = retArray[j];

                    if (j == k || k < tArray.count) {
                        continue;
                    }
                    
                    NSMutableArray *aaa = [NSMutableArray arrayWithArray:tArray];
                    [aaa addObject:array[k]];
                    NSLog(@"aaa = %@",aaa);
                    if (![self arrayInArray:tmpArray subArray:aaa]) {
                        [tmpArray addObject:aaa];
                    }
                    NSLog(@"tmpArray = %@",tmpArray);
                }
            }
        }
        
        retArray = tmpArray;
        NSLog(@"retArray = %@",retArray);
        
    }
    
    return retArray;
}



- (BOOL)arrayInArray:(NSArray *)array subArray:(NSArray *)subArray{
    BOOL bRet = NO;
    for (int i = 0; i < array.count; i++) {
        NSArray *tmpArray = array[i];
        if (tmpArray.count == subArray.count) {
            int sameNum = 0;
            for (int j = 0; j < tmpArray.count; j++) {
                if ([tmpArray[j] intValue] == [subArray[j] intValue]) {
                    sameNum++;
                }
            }
            if (sameNum == tmpArray.count) {
                bRet = YES;
                break;
            }
            
        }
    }
    return bRet;
}


@end
