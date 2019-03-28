//
//  PerfectSquare.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/3/28.
//  Copyright © 2019 lly. All rights reserved.
//

//367. Valid Perfect Square
//Easy
//
//417
//
//97
//
//Favorite
//
//Share
//Given a positive integer num, write a function which returns True if num is a perfect square else False.
//
//Note: Do not use any built-in library function such as sqrt.
//
//Example 1:
//
//Input: 16
//Output: true
//Example 2:
//
//Input: 14
//Output: false
//Accepted
//103.1K
//Submissions
//261.1K

#import "PerfectSquare.h"

@implementation PerfectSquare

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSInteger squareNum = 0;
        
        NSTimeInterval start = CFAbsoluteTimeGetCurrent();
        
        for (int i = 1; i < 10000; i++) {
            if ([self isPerfectSquare2:i]) {
                NSLog(@"i = %d Square = %ld",i,(long)sqrtl(i));
                squareNum++;
            }
        }
        
        NSTimeInterval end = CFAbsoluteTimeGetCurrent();
        
        NSLog(@"total num = %ld , total time = %f毫秒",(long)squareNum,(end-start)*1000);
    }
    return self;
}

- (BOOL)isPerfectSquare:(NSInteger)num{
    
    NSInteger end = ceil(num/3.0);
    for (int i = 1; i <= end; i++) {
        if (i*i == num) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isPerfectSquare2:(NSInteger)num{
    
    NSInteger begin = 1,end = ceil(num/3.0);
    NSInteger mid;
    
    while (begin <= end) {
        
        mid = (end + begin)/2;
        
        if (mid * mid > num) {
            end = mid-1;
        }
        else if (mid * mid < num){
            begin = mid+1;
        }
        else{
            return YES;
        }
    }
    
    return NO;
    
}

@end
