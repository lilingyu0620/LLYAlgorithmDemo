//
//  BinarySearch.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/3/30.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "BinarySearch.h"

//二分查找

@implementation BinarySearch

- (instancetype)init{
    self = [super init];
    if (self) {
        NSArray *array = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12];
        int index = [self binarySearch:array target:2];
        NSLog(@"current index = %d value = %@",index,array[index]);
    }
    return self;
}



- (int)binarySearch:(NSArray *)sourceArray target:(int)target{
    
    int min,max,mid;
    
    min = 0;
    max = sourceArray.count - 1;
    mid = (min + max)/2;
    
    while (min <= max) {
        int tmp = [sourceArray[mid] intValue];
        if (tmp > target) {
            max = mid;
        }
        else if(tmp < target){
            min = mid;
        }
        else{
            return mid;
        }
        mid = (min + max)/2;
    }
    
    return -1;
}

@end
