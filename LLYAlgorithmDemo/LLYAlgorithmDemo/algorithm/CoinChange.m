//
//  CoinChange.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/11/1.
//  Copyright © 2018 lly. All rights reserved.
//

#import "CoinChange.h"

@implementation CoinChange

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        int coinNum = [self coinChange:@[@5,@2,@1] target:11];
        int coinNum = [self coinChange:@[@2] target:3];
        NSLog(@"coinNum = %d",coinNum);
        
    }
    return self;
}

- (int)coinChange:(NSArray *)array target:(int)target{
    
    int iRet = 0;
    int cur = 0;
    int curIndex = 0;
    
    //需要先将array降序排列
    while (cur < target && curIndex < array.count) {
        
        int coin = [array[curIndex] intValue];
        
        if ((cur + coin) < target) {
            cur += coin;
            iRet++;
        }
        else if ((cur + coin) == target){
            return ++iRet;
        }
        else{
            curIndex++;
        }
    }
    
    return -1;
    
}

@end
