//
//  RotateList.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/25.
//  Copyright © 2018年 lly. All rights reserved.
//


//Given a linked list, rotate the list to the right by k places, where k is non-negative.
//
//Example 1:
//
//Input: 1->2->3->4->5->NULL, k = 2
//Output: 4->5->1->2->3->NULL
//Explanation:
//rotate 1 steps to the right: 5->1->2->3->4->NULL
//rotate 2 steps to the right: 4->5->1->2->3->NULL
//Example 2:
//
//Input: 0->1->2->NULL, k = 4
//Output: 2->0->1->NULL
//Explanation:
//rotate 1 steps to the right: 2->0->1->NULL
//rotate 2 steps to the right: 1->2->0->NULL
//rotate 3 steps to the right: 0->1->2->NULL
//rotate 4 steps to the right: 2->0->1->NULL

#import "RotateList.h"

@implementation RotateList{
    NSMutableArray *_rotateArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _rotateArray = [NSMutableArray arrayWithArray:@[@0,@1,@2]];
        [self rotateList:_rotateArray rotateTime:4];
        NSLog(@"_rotateArray = %@",_rotateArray);
    }
    return self;
}

- (void)rotateList:(NSMutableArray *)array rotateTime:(int)k{
    
    id tmp;
    int index = k;
    while (index > 0) {
        for (int i = array.count - 1; i >= 0; i--) {
            
            if (i == array.count - 1) {
                tmp = array[i];
            }
            
            if(i == 0){
                array[i] = tmp;
            }
            else{
                array[i] = array[i-1];
            }
        }
        index--;
    }
}

@end
