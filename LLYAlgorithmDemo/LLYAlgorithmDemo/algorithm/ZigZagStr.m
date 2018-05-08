//
//  ZigZagStr.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/5/8.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ZigZagStr.h"

@implementation ZigZagStr{
    NSMutableArray <NSMutableArray *> *strArray;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        
        strArray = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithCapacity:20],[NSMutableArray arrayWithCapacity:20],[NSMutableArray arrayWithCapacity:20],[NSMutableArray arrayWithCapacity:20], nil];
        
        NSString *str = [self convert2:@"PAYPALISHIRING" rowNum:4];
        NSLog(@"ZigZagStr = %@",str);
        
    }
    return self;
}

- (NSString *)convert:(NSString *)str rowNum:(int)rowNum{
    
    int length = (int)str.length;
    int m = 0,n = 0,index = 0;
    
    //index标识当前字符串索引,m标识二维数组行，n标识二维数组列
    while (index < length) {
        while (m < rowNum && index < length) {
            [strArray[m] addObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:index]]];
            NSLog(@"char = %@,m = %d,n = %d",[NSString stringWithFormat:@"%c",[str characterAtIndex:index]],m,n);
            m++;
            index++;
        }
        m--;
        while (m > 0 && index < length) {
            m--;
            n++;
            [strArray[m] addObject:[NSString stringWithFormat:@"%c",[str characterAtIndex:index]]];
            NSLog(@"char = %@,m = %d,n = %d",[NSString stringWithFormat:@"%c",[str characterAtIndex:index]],m,n);
            index++;
        }
        m++;
    }
    NSMutableString *mStr = [NSMutableString string];
    
    for (NSMutableArray *array in strArray) {
        for (id obj in array) {
            if (obj) {
                [mStr appendString:obj];
            }
        }
    }
    
    return mStr;
}


- (NSString *)convert2:(NSString *)str rowNum:(int)rowNum{
    
    NSMutableString *strRet = [NSMutableString string];
    int length = (int)str.length;
    
    //首行和尾行，每一个元素的间距
    int topBottomPadding = (rowNum<<1) - 2;
    
    //处理首行
    for (int i = 0; i < length; i += topBottomPadding) {
        [strRet appendString:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]];
        NSLog(@"char = %@,index = %d",[NSString stringWithFormat:@"%c",[str characterAtIndex:i]],i);

    }
    
    //中间行的间隔为 topBottomPadding-2*i 2*i
    for (int i = 1; i < rowNum - 1; i++) {
        int midPadding = (i<<1);
        for (int j = i; j < length; j += midPadding) {
            [strRet appendString:[NSString stringWithFormat:@"%c",[str characterAtIndex:j]]];
            NSLog(@"char = %@,index = %d",[NSString stringWithFormat:@"%c",[str characterAtIndex:j]],j);
            midPadding = topBottomPadding - midPadding;
        }
    }
    
    //处理尾行
    for (int i = rowNum - 1; i < length; i += topBottomPadding) {
        [strRet appendString:[NSString stringWithFormat:@"%c",[str characterAtIndex:i]]];
        NSLog(@"char = %@,index = %d",[NSString stringWithFormat:@"%c",[str characterAtIndex:i]],i);
    }
    
    return strRet;
}

@end
