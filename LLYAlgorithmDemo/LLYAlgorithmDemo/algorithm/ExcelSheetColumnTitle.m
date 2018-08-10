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
        
        NSMutableArray *excelStr = [self excelSheetColumnTitle:26];
        NSLog(@"excelStr = %@",excelStr);
        
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

@end
