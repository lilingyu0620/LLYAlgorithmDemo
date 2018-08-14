//
//  LargestNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/13.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "LargestNumber.h"

@implementation LargestNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *str = [self largestNumber:@[@3,@30,@34,@5,@9]];
        NSLog(@"str = %@",str);
        
    }
    return self;
}

- (NSString *)largestNumber:(NSArray *)array{
    
    NSString *tmpStr = [array[0] stringValue];
    for (int i = 1; i < array.count; i++) {
        
        NSString *s1 = [NSString stringWithFormat:@"%@%@",tmpStr,array[i]];
        NSString *s2 = [NSString stringWithFormat:@"%@%@",array[i],tmpStr];
        
        NSComparisonResult res = [s1 compare:s2];
        if (res == NSOrderedAscending) {
            tmpStr = s2;
        }
        else{
            tmpStr = s1;
        }
    }
    
    return tmpStr;
    
}

@end
