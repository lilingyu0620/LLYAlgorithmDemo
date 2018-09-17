//
//  FindDuplicateNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/17.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "FindDuplicateNumber.h"

@implementation FindDuplicateNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int num = [self findDuplicateNumber:@[@1,@3,@4,@2,@2]];
        int num = [self findDuplicateNumber:@[@3,@1,@3,@4,@2]];
        NSLog(@"num = %d",num);
        
    }
    return self;
}

- (int)findDuplicateNumber:(NSArray *)array{

    int slow = [array[0] intValue];
    int fast = [array[slow] intValue];
    
    NSLog(@"slow = %d fast = %d",slow,fast);
    while (slow != fast) {
        slow = [array[slow] intValue];
        fast = [array[[array[fast] intValue]] intValue];
        NSLog(@"slow = %d fast = %d",slow,fast);
    }
    
    fast = 0;
    
    while (slow != fast) {
        NSLog(@"slow = %d fast = %d",slow,fast);
        fast = [array[fast] intValue];
        slow = [array[slow] intValue];
        NSLog(@"slow = %d fast = %d",slow,fast);
    }
    
    return slow;
}

@end
