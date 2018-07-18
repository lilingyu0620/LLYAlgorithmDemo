//
//  DistinctSubsequences.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/18.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "DistinctSubsequences.h"

@implementation DistinctSubsequences{
    int _count;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self distinctSubsequences:[NSMutableString string] oriStr:@"babgbag" targetStr:@"bag" index:0];
        NSLog(@"count = %ld",(long)_count);
        
    }
    return self;
}

- (void)distinctSubsequences:(NSMutableString *)subStr oriStr:(NSString *)oriStr targetStr:(NSString *)targetStr index:(int)index{
    
    if ([subStr isEqualToString:targetStr]) {
        NSLog(@"substr = %@",subStr);
        _count++;
    }
    
    for (int i = index; i < oriStr.length; i++) {
        [subStr appendString:[oriStr substringWithRange:NSMakeRange(i, 1)]];
        [self distinctSubsequences:subStr oriStr:oriStr targetStr:targetStr index:i + 1];
        [subStr replaceCharactersInRange:NSMakeRange(subStr.length - 1, 1) withString:@""];
    }
    
}

@end
