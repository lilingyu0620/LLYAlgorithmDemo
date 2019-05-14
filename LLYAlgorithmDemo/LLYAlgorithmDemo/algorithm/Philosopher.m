//
//  Philosopher.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/5/13.
//  Copyright © 2019 lly. All rights reserved.
//
// 5个哲学家使用5只筷子吃面条。。。一个筷子相当于一个信号量资源，一个哲学家相当于一个线程

#import "Philosopher.h"

@interface Philosophers : NSThread

@property (nonatomic, strong) NSMutableArray *chopsticks;
@property (nonatomic, strong) dispatch_semaphore_t rr;

- (instancetype)initWithChopsticks:(NSMutableArray *)chopsticks semaphore:(dispatch_semaphore_t)rr;
- (void)eat;
- (void)thinking;

@end

@implementation Philosophers

- (instancetype)initWithChopsticks:(NSMutableArray *)chopsticks semaphore:(dispatch_semaphore_t)rr{
    
    self = [super init];
    if (self) {
        self.chopsticks = chopsticks;
        self.rr = rr;
    }
    return self;
}

- (void)eat{
    NSLog(@"%@号哲学家进餐中。。。",self.name);
    sleep(1);
}

- (void)thinking{
    NSLog(@"%@号哲学家思考中。。。",self.name);
    sleep(2);
}

- (void)main{
    
    while (1) {
        
        [self thinking];
        
        //保证同时只有4个哲学家在进餐
        dispatch_semaphore_wait(self.rr, DISPATCH_TIME_FOREVER);
        
        //拿筷子
        int index = [self.name intValue];
        //拿左边的筷子
        dispatch_semaphore_t left = self.chopsticks[index];
        dispatch_semaphore_wait(left, DISPATCH_TIME_FOREVER);
        //拿右边的筷子
        dispatch_semaphore_t right = self.chopsticks[(index + 1) % 5];
        dispatch_semaphore_wait(right, DISPATCH_TIME_FOREVER);
        
        [self eat];
        
        //放下右边的筷子
        dispatch_semaphore_signal(right);
        //放下左边的筷子
        dispatch_semaphore_signal(left);
        
        dispatch_semaphore_signal(self.rr);
        
        [self thinking];
    }
    
}

@end

@interface Philosopher ()

@property (nonatomic, strong) Philosophers *Philosophers0;
@property (nonatomic, strong) Philosophers *Philosophers1;
@property (nonatomic, strong) Philosophers *Philosophers2;
@property (nonatomic, strong) Philosophers *Philosophers3;
@property (nonatomic, strong) Philosophers *Philosophers4;

@end

@implementation Philosopher{
    NSMutableArray *_chopsticks;
    dispatch_semaphore_t _r;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        _chopsticks = [NSMutableArray arrayWithArray:@[dispatch_semaphore_create(1),dispatch_semaphore_create(1),dispatch_semaphore_create(1),dispatch_semaphore_create(1),dispatch_semaphore_create(1)]];
        _r = dispatch_semaphore_create(4);
        
        [self startLaunch];
    }
    return self;
}

- (void)startLaunch{
    
    self.Philosophers0 = [[Philosophers alloc]initWithChopsticks:_chopsticks semaphore:_r];
    [self.Philosophers0 setName:@"0"];
    [self.Philosophers0 start];
    
    self.Philosophers1 = [[Philosophers alloc]initWithChopsticks:_chopsticks semaphore:_r];
    [self.Philosophers1 setName:@"1"];
    [self.Philosophers1 start];
    
    self.Philosophers2 = [[Philosophers alloc]initWithChopsticks:_chopsticks semaphore:_r];
    [self.Philosophers2 setName:@"2"];
    [self.Philosophers2 start];
    
    self.Philosophers3 = [[Philosophers alloc]initWithChopsticks:_chopsticks semaphore:_r];
    [self.Philosophers3 setName:@"3"];
    [self.Philosophers3 start];
    
    self.Philosophers4 = [[Philosophers alloc]initWithChopsticks:_chopsticks semaphore:_r];
    [self.Philosophers4 setName:@"4"];
    [self.Philosophers4 start];
    
}

@end
