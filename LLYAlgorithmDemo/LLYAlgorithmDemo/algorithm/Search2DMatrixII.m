//
//  Search2DMatrixII.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/5.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "Search2DMatrixII.h"

@implementation Search2DMatrixII

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *matrix = @[@[@1,@4,@7,@11,@15],@[@2,@5,@8,@12,@19],@[@3,@6,@9,@16,@22],@[@10,@13,@14,@17,@24],@[@18,@21,@23,@26,@30]];
        BOOL find = [self searchMatrix:matrix target:19];
        NSLog(@"find = %d",find);
        
    }
    return self;
}

//因为是已排序的查找 直接使用二分 【0，0】【1，1】【2，2】

- (BOOL)searchMatrix:(NSArray *)matrix target:(int)target{
    
    
    BOOL bRet = NO;
    
    NSArray *tmpArray = [matrix firstObject];
    
    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
    
    for (int i = 0; i < tmpArray.count; i++) {
        
        //i行和i列各使用二分查一遍，如果没有找到继续找，找到后直接返回
        
        //先查找行
        NSArray *rowArray = matrix[i];
        if ([self bSearch:rowArray target:target]) {
            bRet = YES;
            break;
        }
        
        //再查找列
        NSMutableArray *colArray = [NSMutableArray array];
        for (int j = i; j < tmpArray.count; j++) {
            [colArray addObject:matrix[j][i]];
        }
        
        if ([self bSearch:colArray target:target]) {
            bRet = YES;
            break;
        }
        
    }
    
    NSTimeInterval endTime = [NSDate timeIntervalSinceReferenceDate];

    NSLog(@"run time = %f",(endTime - startTime));
    
    return bRet;
    
}

- (BOOL)bSearch:(NSArray *)array target:(int)target{

    int begin = 0,end = array.count - 1;
    int mid;
    while (begin <= end) {
        
        mid = (begin + end)/2;
        int tmp = [array[mid] intValue];
        
        if (tmp > target) {
            end = mid-1;
        }else if (tmp < target){
            begin = mid+1;
        }else{
            return YES;
        }
    }
    return NO;
}

@end
