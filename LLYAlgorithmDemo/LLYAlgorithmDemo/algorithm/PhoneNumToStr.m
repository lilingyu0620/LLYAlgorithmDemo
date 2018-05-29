//
//  PhoneNumToStr.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/29.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "PhoneNumToStr.h"
//
//
//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//
//
//Example:
//
//Input: "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].


@implementation PhoneNumToStr
{
    NSMutableArray *_mArray;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        
        _mArray = [NSMutableArray array];
        
        NSArray *array = [self phoneNumToStrArray:@"29"];
        _mArray = [self phoneNumToStr:array];
        NSLog(@"_mArray = %@",_mArray);
        
    }
    return self;
}


- (NSMutableArray *)phoneNumToStr:(NSArray *)phoneNumStrArray{
    
    NSMutableArray *retArray = [NSMutableArray array];
    [retArray addObject:@""];
    
    for (int i = 0; i < phoneNumStrArray.count; i++) {
        
        NSArray *array = phoneNumStrArray[i];
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (int j = 0; j < array.count; j++) {
            
            for (int k = 0;k < retArray.count ; k++) {
                [tmpArray addObject:[NSString stringWithFormat:@"%@%@",retArray[k],array[j]]];
            }
        }

        retArray = tmpArray;
    }
    
    return retArray;
    
}
//
//- (void)phoneNumToStr:(NSArray *)phoneNumStrArray strIndex:(int)strIndex arrayIndex:(int)arrayIndex tmpStr:(NSString *)tmpStr{
//
//    NSLog(@"tmpStr = %@",tmpStr);
//
//    if (tmpStr.length == phoneNumStrArray.count) {
//        [_mArray addObject:tmpStr];
//        return;
//    }
//
//    NSLog(@"strIndex = %d,arrayIndex = %d",strIndex,arrayIndex);
//
//    if (arrayIndex == phoneNumStrArray.count) {
//        return;
//    }
//
//    NSArray *array = phoneNumStrArray[arrayIndex];
//
//    if (strIndex == array.count) {
//        return;
//    }
//
//    if (arrayIndex < phoneNumStrArray.count) {
//        [self phoneNumToStr:phoneNumStrArray strIndex:strIndex arrayIndex:arrayIndex + 1 tmpStr:[NSString stringWithFormat:@"%@%@",tmpStr,array[strIndex]]];
//    }
//
//    if (strIndex < array.count) {
//        [self phoneNumToStr:phoneNumStrArray strIndex:strIndex + 1 arrayIndex:arrayIndex tmpStr:tmpStr];
//    }
//
//}

- (NSMutableArray *)phoneNumToStrArray:(NSString *)phoneNumStr{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    for (int i = 0; i < phoneNumStr.length; i++) {
        
        unichar c = [phoneNumStr characterAtIndex:i];
        NSArray *array = [self charToArray:c];
        [retArray addObject:array];
    }
    
    return retArray;
}

- (NSArray *)charToArray:(unichar)c{
    
    if (c == '2') {
        return @[@"a",@"b",@"c"];
    }
    else if (c == '3'){
        return @[@"d",@"e",@"f"];
    }
    else if (c == '4'){
        return @[@"g",@"h",@"i"];
    }
    else if (c == '5'){
        return @[@"j",@"k",@"l"];
    }
    else if (c == '6'){
        return @[@"m",@"n",@"o"];
    }
    else if (c == '7'){
        return @[@"p",@"q",@"r"];
    }
    else if (c == '8'){
        return @[@"t",@"u",@"v"];
    }
    else if (c == '9'){
        return @[@"w",@"x",@"y",@"z"];
    }
    
    return nil;
    
}

@end
