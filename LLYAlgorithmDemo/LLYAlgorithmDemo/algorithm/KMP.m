//
//  KMP.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/25.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "KMP.h"

@implementation KMP{
    NSMutableArray *_kmpArray;
}

- (instancetype)init{

    self = [super init];

    if (self) {
        [self kmpArrayWithNeedleStr:@"aabbbbabdbdbc"];
    }
    
    return self;
}


- (void)kmpArrayWithNeedleStr:(NSString *)needleStr{
    
    _kmpArray = [NSMutableArray arrayWithCapacity:(needleStr.length - 1)];
    for (int i = 0; i < needleStr.length - 1; i++) {
        [_kmpArray addObject:@0];
    }
    
    NSLog(@"_kmpArray = %@",_kmpArray);
    
}


@end
