//
//  AdditiveNumber.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/27.
//  Copyright © 2018年 lly. All rights reserved.
//

//Additive number is a string whose digits can form additive sequence.
//
//A valid additive sequence should contain at least three numbers. Except for the first two numbers, each subsequent number in the sequence must be the sum of the preceding two.
//
//Given a string containing only digits '0'-'9', write a function to determine if it's an additive number.
//
//Note: Numbers in the additive sequence cannot have leading zeros, so sequence 1, 2, 03 or 1, 02, 3 is invalid.
//
//Example 1:
//
//Input: "112358"
//Output: true
//Explanation: The digits can form an additive sequence: 1, 1, 2, 3, 5, 8.
//1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
//Example 2:
//
//Input: "199100199"
//Output: true
//Explanation: The additive sequence is: 1, 99, 100, 199.
//1 + 99 = 100, 99 + 100 = 199

#import "AdditiveNumber.h"

@implementation AdditiveNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        bool isAdditive = [self additiveNumber:@"112358"];
//        bool isAdditive = [self additiveNumber:@"1991001990"];
        NSLog(@"isAdditive = %d",isAdditive);
    }
    return self;
}

- (BOOL)additiveNumber:(NSString *)str{
    
    int num1,num2,sum;
    bool isAdditive = NO;
    
    int loc = 0,len1 = 1,len2 = 1;
    
    for (int i = 0; i < str.length; i+=len1) {
        
        isAdditive = NO;
        
        num1 = [[str substringWithRange:NSMakeRange(loc, len1)] intValue];
        
        for (int j = loc+len1; j < str.length; j++) {
            
            
            num2 = [[str substringWithRange:NSMakeRange(loc+len1, j-loc-len1+1)] intValue];
            
            for (int k = j+1; k < str.length; k++) {
                
                sum = [[str substringWithRange:NSMakeRange(j+1, k-j)] intValue];

                if (num1+num2 == sum) {
                    isAdditive = YES;
                    if (k == str.length - 1) {
                        return YES;
                    }
                    break;
                }
                
            }
            
            if (isAdditive == YES) {
                len2 = j-loc-len1+1;
                break;
            }
            else{
                continue;
            }
            
        }
        
        if (isAdditive == YES) {
            loc += len1;
            len1 = len2;
            continue;
        }
        else{
            len1++;
        }
        
    }
    
    return NO;
}

@end
