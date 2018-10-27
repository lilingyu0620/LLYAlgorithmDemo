//
//  CreateMaximumNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/10/26.
//  Copyright © 2018 lly. All rights reserved.
//

#import "CreateMaximumNumber.h"

@implementation CreateMaximumNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *array = [self createMaximumNumber:@[@3,@4,@6,@5] array2:@[@9,@1,@2,@5,@8,@3] k:5];
//        NSArray *array = [self createMaximumNumber:@[@6,@7] array2:@[@6,@0,@4] k:5];
        NSArray *array = [self createMaximumNumber:@[@3,@9] array2:@[@8,@9] k:3];

        NSLog(@"array = %@",array);
        
//        NSArray *array1 = [self createMaximumNumber1:@[@9,@1,@2,@5,@8,@3] k:5];
//        NSLog(@"array1 = %@",array1);
        
    }
    return self;
}

- (NSArray *)createMaximumNumber:(NSArray *)array1 array2:(NSArray *)array2 k:(int)k{
    
    if (array1.count + array2.count < k) {
        return nil;
    }
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSMutableArray *oriArray1 = [NSMutableArray arrayWithArray:array1];
    NSMutableArray *oriArray2 = [NSMutableArray arrayWithArray:array2];
    
    
    while (tmpArray.count < k) {
        
        int maxIdx1 = [self maxNum:oriArray1 length:k-tmpArray.count-oriArray2.count];
        int maxIdx2 = [self maxNum:oriArray2 length:k-tmpArray.count-oriArray1.count];
        
        if (maxIdx1 == -1 && maxIdx2 == -1) {
            break;
        }
        
        if (maxIdx1 == -1) {
            
            [tmpArray addObject:oriArray2[maxIdx2]];
            int count = oriArray2.count;
            for (int i = 0; i <= maxIdx2 && i < count; i++) {
                [oriArray2 removeObjectAtIndex:0];
            }
            
            continue;
            
        }
        
        if (maxIdx2 == -1) {
            
            [tmpArray addObject:oriArray1[maxIdx1]];
            int count = oriArray1.count;
            for (int i = 0; i <= maxIdx1 && i < count; i++) {
                [oriArray1 removeObjectAtIndex:0];
            }
            
            continue;

        }
        
        if ([oriArray1[maxIdx1] intValue] >= [oriArray2[maxIdx2] intValue]) {
            [tmpArray addObject:oriArray1[maxIdx1]];
            int count = oriArray1.count;
            for (int i = 0; i <= maxIdx1 && i < count; i++) {
                [oriArray1 removeObjectAtIndex:0];
            }
        }
        else{
            [tmpArray addObject:oriArray2[maxIdx2]];
            int count = oriArray2.count;
            for (int i = 0; i <= maxIdx2 && i < count; i++) {
                [oriArray2 removeObjectAtIndex:0];
            }
        }
        
    }
    
    return tmpArray;
    
}


- (NSArray *)createMaximumNumber1:(NSArray *)array k:(int)k{

    if (array.count < k) {
        return nil;
    }
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSMutableArray *oriArray = [NSMutableArray arrayWithArray:array];
    
    while (tmpArray.count < k) {
        
        int maxIndex = [self maxNum:oriArray length:(k-tmpArray.count)];
        [tmpArray addObject:oriArray[maxIndex]];
        int count = oriArray.count;
        
        for (int i = 0; i <= maxIndex && i < count; i++) {
            [oriArray removeObjectAtIndex:0];
        }
    }
    
    return tmpArray;
    
}

- (int)maxNum:(NSArray *)array length:(int)length{
    
    int index = -1;
    
    NSMutableArray *array1 = [NSMutableArray arrayWithArray:array];
    NSMutableArray *array2 = [NSMutableArray array];
    
    //将数组按大小排序,以索引方式记录
    while (array2.count < array.count) {
        
        int maxNum = 0,maxIdx = -1;
        
        for (int i = 0; i < array1.count; i++) {
            
            if ([array1[i] intValue] >= maxNum) {
                maxNum = [array1[i] intValue];
                maxIdx = i;
            }
            
        }
        
        [array2 addObject:@(maxIdx)];
        array1[maxIdx] = @(-1);
    }
    
    for (int i = 0; i < array2.count; i++) {
        if (array.count - [array2[i] intValue] >= length) {
            index = [array2[i] intValue];
            break;
        }
    }
    
    return index;
}

@end
