//
//  RestoreIPAddresses.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/10.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a string containing only digits, restore it by returning all possible valid IP address combinations.
//
//Example:
//
//Input: "25525511135"
//Output: ["255.255.11.135", "255.255.111.35"]

#import "RestoreIPAddresses.h"

@implementation RestoreIPAddresses{
    NSMutableArray *_array;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _array  = [NSMutableArray array];
        
        [self restoreIPAddresses:@"128001"];
        
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}

- (void)restoreIPAddresses:(NSString *)addressStr{
 
    for (int a = 1; a <= 3; a++) {
        for (int b = 1; b <= 3; b++) {
            for (int c = 1; c <= 3; c++) {
                for (int d = 1; d <= 3; d++) {
                
                    if (a+b+c+d > addressStr.length) {
                        continue;
                    }
                    
                    NSString *str1 = [addressStr substringWithRange:NSMakeRange(0, a)];
                    NSString *str2 = [addressStr substringWithRange:NSMakeRange(a, b)];
                    NSString *str3 = [addressStr substringWithRange:NSMakeRange(a + b, c)];
                    NSString *str4 = [addressStr substringWithRange:NSMakeRange(a + b + c, d)];
                    
                    if ([str1 intValue] <= 255 && [str2 intValue] <= 255 && [str3 intValue] <= 255 && [str4 intValue] <= 255) {
                        if (str1.length + str2.length + str3.length + str4.length == addressStr.length) {
                            [_array addObject:[NSString stringWithFormat:@"%@.%@.%@.%@",str1,str2,str3,str4]];
                        }
                    }
                }
            }
        }
    }
}

@end
