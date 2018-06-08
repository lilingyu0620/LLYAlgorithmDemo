//
//  RotateImage.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/6/8.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "RotateImage.h"

@implementation RotateImage{
    NSMutableArray *_array;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
    
        _array = [NSMutableArray arrayWithObjects:[NSMutableArray arrayWithArray:@[@1,@2,@3]],[NSMutableArray arrayWithArray:@[@4,@5,@6]],[NSMutableArray arrayWithArray:@[@7,@8,@9]], nil];
        
        [self rotateImage:_array];
        
        NSLog(@"_array = %@",_array);
        
    }
    return self;
}


- (void)rotateImage:(NSMutableArray *)array{
    
    int len = array.count;
    int i = 0,j = 0;
    while (len >= 1) {
        
        for (int jj = j; jj < len - 1; jj++) {
            [self rotateSingle:array i:i j:jj len:len];
        }
        i++;
        j++;
        len--;
    }
}

- (void)rotateSingle:(NSMutableArray *)array i:(int)i j:(int)j len:(int)len{
    
    NSLog(@"array = %@",array);
    
    NSMutableArray *tmp1Array = array[i];
    id tmp1 = tmp1Array[j];
    
    NSMutableArray *tmp2Array = array[j];
    id tmp2 = tmp2Array[len - 1];
    
    NSMutableArray *tmp3Array = array[len - 1];
    id tmp3 = tmp3Array[len - 1 - j + i];
    
    NSMutableArray *tmp4Array = array[len - 1 - j + i];
    id tmp4 = tmp4Array[i];
    
    //交换
    tmp2Array[len - 1] = tmp1;
    
    tmp3Array[len - 1 - j + i] = tmp2;
    tmp4Array[i] = tmp3;
    
    tmp1Array[j] = tmp4;
    
    NSLog(@"array = %@",array);
    
}

@end
