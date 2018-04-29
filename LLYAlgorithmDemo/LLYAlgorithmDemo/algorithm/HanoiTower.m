//
//  HanoiTower.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/4/29.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "HanoiTower.h"

@implementation HanoiTower

- (instancetype)init{
    
    self = [super init];
    if (self) {
        [self hanoi:6 towerA:@"towerA" towerB:@"towerB" towerC:@"towerC"];
    }
    return self;
}

- (void)hanoi:(int)heightNum towerA:(NSString *)towerA towerB:(NSString *)towerB towerC:(NSString *)towerC{
    
    if (heightNum == 0) return;
    
    [self hanoi:(heightNum - 1) towerA:towerA towerB:towerC towerC:towerB];
    NSLog(@"%@ --> %@",towerA,towerB);
    [self hanoi:(heightNum - 1) towerA:towerC towerB:towerB towerC:towerA];
}

@end
