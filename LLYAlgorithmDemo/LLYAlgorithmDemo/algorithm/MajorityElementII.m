//
//  MajorityElementII.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/28.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MajorityElementII.h"

@implementation MajorityElementII

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *array = [self majorityElementII:@[@3,@2,@3]];
        NSArray *array = [self majorityElementII:@[@1,@1,@1,@3,@3,@2,@2,@2]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)majorityElementII:(NSArray *)array{
    
    int num1 = [array.firstObject intValue];
    int num2 = [array.firstObject intValue];
    int count1 = 0,count2 = 0;
    
    for (int i = 0; i < array.count; i++) {
        
        int num = [array[i] intValue];
        
        if (num == num1) {
            count1++;
        }
        else if (num == num2){
            count2++;
        }
        else if (count1 == 0){
            num1 = num;
            count1++;
        }
        else if (count2 == 0){
            num2 = num;
            count2++;
        }
        else{
            count1--;
            count2--;
        }
    }
    
    count1 = 0;
    count2 = 0;
    for (int i = 0; i < array.count; i++) {
        
        int num = [array[i] intValue];
        if (num == num1) {
            count1++;
        }
        else if (num == num2){
            count2++;
        }
    }
    NSMutableArray *bArray = [NSMutableArray array];
    if (count1 > array.count / 3) {
        [bArray addObject:@(num1)];
    }
    if (count2 > array.count / 3) {
        [bArray addObject:@(num2)];
    }
    
    return bArray;
}

@end
