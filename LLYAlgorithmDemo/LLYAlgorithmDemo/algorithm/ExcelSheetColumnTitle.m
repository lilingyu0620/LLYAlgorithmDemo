//
//  ExcelSheetColumnTitle.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/10.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ExcelSheetColumnTitle.h"

@implementation ExcelSheetColumnTitle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSMutableArray *excelStr = [self excelSheetColumnTitle:19010];
        NSLog(@"excelStr = %@",excelStr);
        
        int num = [self excelSheetColumnNumber:@"ABCD"];
        NSLog(@"num = %d",num);
        
        
    }
    return self;
}

- (NSMutableArray *)excelSheetColumnTitle:(int)num{
    
    int res = num;
    int div;
    NSMutableArray *array = [NSMutableArray array];
    
    while (res > 0) {
        
        div = res % 26;
        
        if (div != 0) {
            char c =  [@(div + 64) charValue];
            [array insertObject:[NSString stringWithFormat:@"%c",c] atIndex:0];
        }
        else if(res <= 26){
            char c =  [@(res + 64) charValue];
            [array insertObject:[NSString stringWithFormat:@"%c",c] atIndex:0];
            break;
        }
        
        res = res/26;
    }
    
    return array;
}

- (int)excelSheetColumnNumber:(NSString *)colStr{
    
    int res = 0;
    int bit = 1;
    for (int i = colStr.length - 1; i >= 0; i--) {
        char c = [colStr characterAtIndex:i];
        int num = c - 'A' + 1;
        res = res + num*bit;
        bit *= 26;
    }
    return res;
    
}

@end
