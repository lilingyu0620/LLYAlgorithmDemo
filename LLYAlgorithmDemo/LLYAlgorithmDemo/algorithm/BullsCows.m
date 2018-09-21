//
//  BullsCows.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/9/20.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "BullsCows.h"

@implementation BullsCows

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *bullsCows = [self bullsCows:@"1807" guess:@"7810"];
//        NSString *bullsCows = [self bullsCows:@"1123" guess:@"0111"];
        NSLog(@"bullsCows = %@",bullsCows);
        
    }
    return self;
}

- (NSString *)bullsCows:(NSString *)secret guess:(NSString *)guess{
    
    int rightPosition = 0,wrongPosition = 0;
    
    NSMutableArray *secretArray = [NSMutableArray array];
    for (int i = 0; i < secret.length; i++) {
        [secretArray addObject:[NSString stringWithFormat:@"%c",[secret characterAtIndex:i]]];
    }
    
    for (int i = 0; i < secret.length; i++) {
        if ([secret characterAtIndex:i] == [guess characterAtIndex:i]) {
            rightPosition++;
            [secretArray replaceObjectAtIndex:i withObject:@"-1"];
        }else{
            NSString *cc = [NSString stringWithFormat:@"%c",[guess characterAtIndex:i]];
            NSUInteger index = [secretArray indexOfObject:cc];
            if (index != NSNotFound && index != i) {
                wrongPosition++;
                [secretArray replaceObjectAtIndex:index withObject:@"-1"];
            }
        }
    }
    
    return [NSString stringWithFormat:@"%dA%dB",rightPosition,wrongPosition];
    
}

@end
