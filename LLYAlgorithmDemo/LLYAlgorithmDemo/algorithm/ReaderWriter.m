//
//  ReaderWriter.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/5/16.
//  Copyright © 2019 lly. All rights reserved.
//

#import "ReaderWriter.h"
#import <pthread.h>

@interface Reader : NSThread

@property (nonatomic, assign) NSInteger readerCount;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;

- (instancetype)initWithSemaphore:(dispatch_semaphore_t)semaphore readerCount:(NSInteger)readerCount;

@end

@implementation Reader{
    pthread_mutex_t _mutex;
}

- (instancetype)initWithSemaphore:(dispatch_semaphore_t)semaphore readerCount:(NSInteger)readerCount{
    self = [super init];
    if (self) {
        self.semaphore = semaphore;
        self.readerCount = readerCount;
        pthread_mutex_init(&_mutex,NULL);
    }
    return self;
}

- (void)main{
    
    while (1) {
        
//        sleep(2);
        
        pthread_mutex_lock(&_mutex);
        
        if (self.readerCount == 0) {
            dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        }
        self.readerCount++;
        
        pthread_mutex_unlock(&_mutex);

        
        NSLog(@"%@号读者正在读。。。",self.name);
        
        
        sleep(arc4random() % 3);
        
        pthread_mutex_lock(&_mutex);

        self.readerCount--;
        if (self.readerCount == 0) {
            dispatch_semaphore_signal(self.semaphore);
        }

        pthread_mutex_unlock(&_mutex);
    }
}

@end

@interface Writer : NSThread

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

- (instancetype)initWithSemaphore:(dispatch_semaphore_t)semaphore;

@end

@implementation Writer

- (instancetype)initWithSemaphore:(dispatch_semaphore_t)semaphore{
    self = [super init];
    if (self) {
        self.semaphore = semaphore;
    }
    return self;
}

- (void)main{
    
    while (1) {

        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        
        NSLog(@"写者正在写。。。");
        sleep(2);
        
        dispatch_semaphore_signal(self.semaphore);
    
    }

}

@end

@interface ReaderWriter ()

@property (nonatomic, assign) NSInteger readerCount;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation ReaderWriter

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.readerCount = 0;
        self.semaphore = dispatch_semaphore_create(1);
        
        [self start];
        
    }
    return self;
}

- (void)start{
    
    Reader *reader1 = [[Reader alloc]initWithSemaphore:self.semaphore readerCount:self.readerCount];
    reader1.name = @"1";
    [reader1 start];
    
    Reader *reader2 = [[Reader alloc]initWithSemaphore:self.semaphore readerCount:self.readerCount];
    reader2.name = @"2";
    [reader2 start];
    
    Reader *reader3 = [[Reader alloc]initWithSemaphore:self.semaphore readerCount:self.readerCount];
    reader3.name = @"3";
    [reader3 start];
    
    Writer *writer = [[Writer alloc]initWithSemaphore:self.semaphore];
    [writer start];
    
}

@end
