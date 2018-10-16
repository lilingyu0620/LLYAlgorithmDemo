//
//  MinimumHeightTrees.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/10/16.
//  Copyright © 2018年 lly. All rights reserved.
//

//For a undirected graph with tree characteristics, we can choose any node as the root. The result graph is then a rooted tree. Among all possible rooted trees, those with minimum height are called minimum height trees (MHTs). Given such a graph, write a function to find all the MHTs and return a list of their root labels.
//
//Format
//The graph contains n nodes which are labeled from 0 to n - 1. You will be given the number n and a list of undirected edges (each edge is a pair of labels).
//
//You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
//
//Example 1 :
//
//Input: n = 4, edges = [[1, 0], [1, 2], [1, 3]]
//
//  0
//  |
//  1
// / \
//2   3
//
//Output: [1]
//Example 2 :
//
//Input: n = 6, edges = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 4]]
//
//0  1  2
// \ | /
//   3
//   |
//   4
//   |
//   5
//
//Output: [3, 4]
//Note:
//
//According to the definition of tree on Wikipedia: “a tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.”
//The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.


#import "MinimumHeightTrees.h"

@implementation MinimumHeightTrees

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        NSArray *array = [self findMinHeightTrees:4 edges:@[@[@1,@0],@[@1,@2],@[@1,@3]]];
        NSArray *array = [self findMinHeightTrees:6 edges:@[@[@0,@3],@[@1,@3],@[@2,@3],@[@4,@3],@[@5,@4]]];
        NSLog(@"array = %@",array);
        
    }
    return self;
}

- (NSArray *)findMinHeightTrees:(int)nodeNum edges:(NSArray *)array{
    
    NSMutableArray *retArray = [NSMutableArray array];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *tmpArray = obj;
        [tmpArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (![dic valueForKey:[NSString stringWithFormat:@"%@",obj]]) {
                [dic setValue:@1 forKey:[NSString stringWithFormat:@"%@",obj]];
            }else{
                NSInteger value = [[dic valueForKey:[NSString stringWithFormat:@"%@",obj]] integerValue];
                value++;
                [dic setValue:@(value) forKey:[NSString stringWithFormat:@"%@",obj]];
            }
        }];
    }];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj integerValue] > 1) {
            [retArray addObject:key];
        }
    }];
    
    return retArray;
    
}


@end
