//
//  DifferentWaysAddParentheses.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/6.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "DifferentWaysAddParentheses.h"

@implementation DifferentWaysAddParentheses{
    NSMutableArray *_resArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _resArray = [NSMutableArray array];
        
        NSArray *retArray = [self differentWaysAddParentheses:@"2+3-4*5"];
        NSLog(@"retArray = %@",retArray);

    }
    return self;
}

- (NSArray *)differentWaysAddParentheses:(NSString *)expressStr{
    
    NSMutableArray *numArray = [NSMutableArray array];
    NSMutableArray *operatorArray = [NSMutableArray array];
    NSMutableArray *retArray = [NSMutableArray array];
    
    for (int i = 0; i < expressStr.length; i++) {
        
        char c = [expressStr characterAtIndex:i];
        if (c == '+' || c == '-' || c == '*') {
//            [operatorArray addObject:[NSNumber numberWithChar:c]];
            [operatorArray addObject:[NSString stringWithFormat:@"%c",c]];
        }
        else{
            [numArray addObject:[NSString stringWithFormat:@"%c",c]];
        }
        
    }
    
    [self permutation:operatorArray targetIndex:0];
    
    NSLog(@"_resArray = %@",_resArray);
    
//    for (int i = 0; i < _resArray.count; i++) {
//
//        NSArray *tmpArray = _resArray[i];
//
//        int retValue = [self operation:tmpArray opeArray:operatorArray];
//
//        [retArray addObject:@(retValue)];
//
//    }
    
    return retArray;

}


- (void)permutation:(NSMutableArray *)array targetIndex:(int)index{
    
    if (index == array.count - 1) {
        [_resArray addObject:[NSArray arrayWithArray:array]];
        return;
    }
    
    for (int i = index; i < array.count; i++) {
        
        [self swap:array index1:i index2:index];
        
        [self permutation:array targetIndex:(index + 1)];
        
        [self swap:array index1:i index2:index];
        
    }
    
}

- (void)swap:(NSMutableArray *)tmpArray index1:(int)index1 index2:(int)index2{
    
    id tmp = tmpArray[index1];
    tmpArray[index1] = tmpArray[index2];
    tmpArray[index2] = tmp;
    
}

- (int)operation:(NSArray *)numAray opeArray:(NSArray *)opeArray{
    
    int retValue = [numAray.firstObject intValue];
    for (int i = 1; i < numAray.count; i++) {
        int num = [numAray[i] intValue];
        char c = [opeArray[i-1] charValue];
        if (c == '+') {
            retValue += num;
        }
        else if (c == '-'){
            retValue -= num;
        }
        else if (c == '*'){
            retValue *= num;
        }
    }
    return retValue;
}

@end
