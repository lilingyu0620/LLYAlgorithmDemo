//
//  GetMoneyAmount.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/4/1.
//  Copyright © 2019 lly. All rights reserved.
//

#import "GetMoneyAmount.h"

@implementation GetMoneyAmount

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSInteger pay = [self getMoneyAmount:10 pick:7];
        NSLog(@"pay = %ld",(long)pay);
        
    }
    return self;
}


- (NSInteger)getMoneyAmount:(NSInteger)n pick:(NSInteger)pick{
    
    NSInteger pay = 0;
    
    NSInteger left = 0,right = n;
    NSInteger mid = 0;
    
    while (left <= right) {
        
        mid = (left+right)/2;
        
        if (mid > pick) {
            right = mid-1;
            pay += mid;
        }
        else if(mid < pick){
            left = mid + 1;
            pay += mid;
        }
        else{
            return pay;
        }
    }
    return pay;
}


@end
