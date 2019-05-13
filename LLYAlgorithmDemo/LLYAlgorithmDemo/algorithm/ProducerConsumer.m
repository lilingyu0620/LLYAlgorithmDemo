//
//  ProducerConsumer.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/5/13.
//  Copyright © 2019 lly. All rights reserved.
//

#import "ProducerConsumer.h"
#import <pthread.h>

@implementation ProducerConsumer{
    pthread_mutex_t mutex;//临界区
    dispatch_semaphore_t pd;//生产锁
    dispatch_semaphore_t cs;//消费锁
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    
        pthread_mutex_init(&mutex,NULL);
        cs = dispatch_semaphore_create(0);//需要先生产才能消费
        pd = dispatch_semaphore_create(10);//可同时进行10个生产任务
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self producer];
        });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self consumer];
        });
    }
    return self;
}

- (void)producer{
    
    while (1) {
        
        
        dispatch_semaphore_wait(pd, DISPATCH_TIME_FOREVER);
        
        pthread_mutex_lock(&mutex);
        //生产一个产品
        NSLog(@"生产一个产品");
        
        pthread_mutex_unlock(&mutex);
        
        dispatch_semaphore_signal(cs);
        
        sleep(1);
        
    }
    
}

- (void)consumer{
    
    while (1) {
        
        dispatch_semaphore_wait(cs, DISPATCH_TIME_FOREVER);
        
        pthread_mutex_lock(&mutex);
        //消费一个产品
        NSLog(@"消费一个产品");
        pthread_mutex_unlock(&mutex);
        
        dispatch_semaphore_signal(pd);
        
        sleep(5);
    }
    
}

@end
