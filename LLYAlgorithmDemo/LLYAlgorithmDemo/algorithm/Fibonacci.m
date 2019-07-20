//
//  Fibonacci.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/7/4.
//  Copyright © 2019 lly. All rights reserved.
//

#import "Fibonacci.h"

@implementation Fibonacci

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int num = [self fib:2];
        NSLog(@"num = %d",num);
        
    }
    return self;
}

- (int)Fibonacci:(int)num{
    
    if (num == 1 || num == 2) {
        return 1;
    }
    return [self Fibonacci:num-1] + [self Fibonacci:num-2];
}

- (int)fib:(int)num{
    
    int bef = 1,result = 1;
    while (num > 2) {
        int tmp = result;
        result += bef;
        bef = tmp;
        num--;
    }
    return result;
}

@end
