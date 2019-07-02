//
//  FolderScan.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/6/22.
//  Copyright © 2019 lly. All rights reserved.
//

#import "FolderScan.h"

@implementation FolderScan

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 获取沙盒主目录路径
        NSString *homeDir = NSHomeDirectory();
        // 获取Documents目录路径
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        // 获取Caches目录路径
        NSArray *pathss = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesDir = [paths objectAtIndex:0];
        // 获取tmp目录路径
        NSString *tmpDir =  NSTemporaryDirectory();
        
        
        NSFileManager *fm = [NSFileManager defaultManager];
        NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:homeDir];
        NSString *path = nil;
        while ((path = [dirEnum nextObject]) != nil){
            
            BOOL isDir;
            [fm fileExistsAtPath:path isDirectory:&isDir];
            if (isDir) {
                NSLog(@"%@",path);
            }
        }
        
    }
    return self;
}


- (void)DFS{
    
    
}

- (void)BFS{
    
    
}

@end
