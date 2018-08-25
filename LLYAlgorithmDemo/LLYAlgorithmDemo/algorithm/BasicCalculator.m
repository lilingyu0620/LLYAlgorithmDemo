//
//  BasicCalculator.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/8/25.
//  Copyright © 2018 lly. All rights reserved.
//

#import "BasicCalculator.h"

@implementation BasicCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        int sum = [self basicCalculator:@"(1+(4+5+2)-3)+(6+8)"];
//        int sum = [self basicCalculator:@"2-1 + 2"];
//        int sum = [self basicCalculator:@"1 + 1"];

        NSLog(@"sum = %d",sum);
        
    }
    return self;
}

- (int)basicCalculator:(NSString *)str{
    
    NSMutableArray *numArray = [NSMutableArray array];
    NSMutableArray *operatoaArray = [NSMutableArray array];
    int i = 0;
    while (i < str.length) {
        char c = [str characterAtIndex:i++];
        if (c == '+' || c == '-') {
            [operatoaArray addObject:[NSString stringWithFormat:@"%c",c]];
        }else if (c == '(' || c == ')' || c == ' '){
            continue;
        }
        else{
            [numArray addObject:[NSString stringWithFormat:@"%c",c]];
            
            if(numArray.count == 2 && operatoaArray.count == 1){
                
                NSString *opeStr = operatoaArray.firstObject;
                int num1 = [numArray.firstObject intValue];
                int num2 = [numArray.lastObject intValue];
                [numArray removeAllObjects];
                [operatoaArray removeAllObjects];
                if ([opeStr isEqualToString:@"+"]) {
                    [numArray addObject:@(num1+num2)];
                }
                else{
                    [numArray addObject:@(num1-num2)];
                }
                
            }
        }
    }
    return [numArray.firstObject intValue];
}

@end
