//
//  NSMutableArrayThreads.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/7/1.
//  Copyright © 2019 lly. All rights reserved.
//

#import "NSMutableArrayThreads.h"

@interface Thread1 : NSThread

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Thread1

- (instancetype)initWithArray:(NSMutableArray *)array{
    
    self = [super init];
    if (self) {
        self.array = array;
    }
    return self;
    
}

- (void)main{
    
    while (1) {
        int num = arc4random()%255;
        [self.array addObject:@(num)];
        NSLog(@"%@ %@",[NSThread currentThread],self.array);
        
        sleep(1);
    }
    
}

@end


@interface Thread2 : NSThread

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Thread2

- (instancetype)initWithArray:(NSMutableArray *)array{
    
    self = [super init];
    if (self) {
        self.array = array;
    }
    return self;
    
}

- (void)main{
    
    while (1) {
        [self.array removeLastObject];
        NSLog(@"%@ %@",[NSThread currentThread],self.array);
        
        sleep(2);
    }
    
}

@end


@interface Thread3 : NSThread

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Thread3

- (instancetype)initWithArray:(NSMutableArray *)array{
    
    self = [super init];
    if (self) {
        self.array = array;
    }
    return self;
    
}

- (void)main{
    
    while (1) {
        [self.array removeLastObject];
        NSLog(@"%@ %@",[NSThread currentThread],self.array);
        
        sleep(2);
    }
    
}

@end


@interface NSMutableArrayThreads ()

@property (nonatomic, strong) NSMutableArray *array;

@end


@implementation NSMutableArrayThreads

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.array = [NSMutableArray array];
        
        Thread1 *t1 = [[Thread1 alloc]initWithArray:self.array];
        t1.name = @"1";
        [t1 start];
        
        Thread2 *t2 = [[Thread2 alloc]initWithArray:self.array];
        t2.name = @"2";
        [t2 start];
        
        Thread3 *t3 = [[Thread3 alloc]initWithArray:self.array];
        t3.name = @"3";
        [t3 start];
        
    }
    return self;
}

@end
