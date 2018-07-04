//
//  RemoveDuplicates.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/7/4.
//  Copyright © 2018年 lly. All rights reserved.
//

//Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
//
//Example 1:
//
//Input: 1->2->3->3->4->4->5
//Output: 1->2->5
//Example 2:
//
//Input: 1->1->1->2->3
//Output: 2->3

#import "RemoveDuplicates.h"

@implementation RemoveDuplicates

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *oriArray = @[@1,@2,@3,@3,@4,@4,@5];
        NSArray *oriArray = @[@1,@1,@1,@2,@3];
        NSLog(@"oriArray = %@",oriArray);
        NSArray *array = [self removeDuplicates:oriArray];
        NSLog(@"array = %@",array);
    }
    return self;
}

- (NSArray *)removeDuplicates:(NSArray *)array{
    
    if (!array || array.count == 0) {
        return nil;
    }
    
    NSMutableArray *retArray = [NSMutableArray array];
    BOOL hasRemove = NO;
    
    for (int i = 0; i < array.count; i++) {
        
        if (i > 0 && [array[i] intValue] != [array[i - 1] intValue]) {
            hasRemove = NO;
        }
        
        if ((retArray.count == 0 || [retArray.lastObject intValue] != [array[i] intValue]) && !hasRemove) {
            [retArray addObject:array[i]];
        }
        else if([retArray.lastObject intValue] == [array[i] intValue]){
            [retArray removeLastObject];
            hasRemove = YES;
        }
    }
    
    return retArray;
}

@end
