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
        
        NSString *oriStr = @"aabbababbaaba";
        NSString *needleStr = @"bbaaba";
        
//        int index = [self forceIndex:oriStr needleStr:needleStr];
//        NSLog(@"index = %d",index);
//
//        [self kmpArrayWithNeedleStr:needleStr];
//        int indexKMP = [self indexKMP:oriStr needleStr:needleStr];
//        NSLog(@"index = %d",indexKMP);
        
        NSArray *array = [self findSubstring:@"barfoothefoobarman" subStrArray:@[@"foo",@"bar"]];
        NSLog(@"array = %@",array);
        
    }
    
    return self;
}


- (NSArray *)findSubstring:(NSString *)oriStr subStrArray:(NSArray *)subStrArray{
    
    NSMutableString *tmpStr = [NSMutableString string];
    for (NSString *str in subStrArray) {
        [tmpStr appendString:str];
    }
    
    int index1 = [self forceIndex:oriStr needleStr:tmpStr];
    if (index1 == -1) {
        return nil;
    }
    
    [tmpStr replaceCharactersInRange:NSMakeRange(0, tmpStr.length) withString:@""];
    NSArray *reArray = [[subStrArray reverseObjectEnumerator] allObjects];
    for (NSString *str in reArray) {
        [tmpStr appendString:str];
    }
    
    int index2 = [self forceIndex:oriStr needleStr:tmpStr];
    if (index2 == -1) {
        return nil;
    }
    
    return @[@(index1),@(index2)];
    
}

//暴力匹配
- (int)forceIndex:(NSString *)oriStr needleStr:(NSString *)needleStr{
    if (needleStr.length <= 0) {
        return 0;
    }
    
    if (oriStr.length <= 0) {
        return  -1;
    }
    
    int i = 0,j = 0;
    while (i < oriStr.length) {
        if ([oriStr characterAtIndex:i] == [needleStr characterAtIndex:j]) {
            i++;
            j++;
        }else{
            i = i - j + 1;
            j = 0;
        }
        
        if (j == needleStr.length) {
            return i - j;
        }
    }
    return -1;
}

- (int)indexKMP:(NSString *)oriStr needleStr:(NSString *)needleStr{
    
    if (needleStr.length <= 0) {
        return 0;
    }
    
    if (oriStr.length <= 0) {
        return  -1;
    }
    
    int i = 0,j = 0;
    while (i < oriStr.length && j < needleStr.length) {
        if (j == 0 || [oriStr characterAtIndex:i] == [needleStr characterAtIndex:j]) {
            i++;
            j++;
        }
        else{
            j = [_kmpArray[j] intValue];
        }
    }
    
    if (j == needleStr.length) {
        return i - j;
    }
    else{
        return -1;
    }
    
}

- (void)kmpArrayWithNeedleStr:(NSString *)needleStr{
    
    _kmpArray = [NSMutableArray arrayWithCapacity:(needleStr.length - 1)];
    for (int i = 0; i < needleStr.length; i++) {
        [_kmpArray addObject:@0];
    }
    
    NSLog(@"_kmpArray = %@",_kmpArray);
    
    int i = 0,j = 1;
    while (j < needleStr.length - 1) {
        
        if (i == 0 || [needleStr characterAtIndex:i] == [needleStr characterAtIndex:j]) {
            ++i;
            ++j;
            _kmpArray[j] = @(i);
        }
        else{
            i = [_kmpArray[i] intValue];
        }
    }
    
    NSLog(@"_kmpArray = %@",_kmpArray);

}


@end
