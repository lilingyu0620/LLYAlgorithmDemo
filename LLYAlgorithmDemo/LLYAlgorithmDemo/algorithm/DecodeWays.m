//
//  DecodeWays.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/9.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "DecodeWays.h"

@implementation DecodeWays

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int num = [self numDecodings:@"226"];
        NSLog(@"num = %d",num);
    }
    return self;
}



- (int)numDecodings:(NSString *)string{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    [retArray addObject:@1];
    
    if ([[string substringToIndex:1] intValue] > 0) {
        [retArray addObject:@1];
    }
    else{
        [retArray addObject:@0];
    }
    
    for (int i = 2; i <= string.length; i++) {
        
        int x = [[string substringWithRange:NSMakeRange(i - 1, 1)] intValue];
        int y = [[string substringWithRange:NSMakeRange(i - 2, 2)] intValue];
        
        if (x >= 1 && x <= 9) {
            if (retArray.count <= i) {
                [retArray addObject:@(0)];
            }
            retArray[i] = @([retArray[i - 1] intValue] + [retArray[i] intValue]);
        }
        
        if (y >= 10 && y <= 26) {
            if (retArray.count <= i) {
                [retArray addObject:@(0)];
            }
            retArray[i] = @([retArray[i - 2] intValue] + [retArray[i] intValue]);
        }
    }
    
    return [retArray.lastObject intValue];
    
}

@end
