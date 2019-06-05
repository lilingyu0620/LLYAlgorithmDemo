//
//  BinaryTree.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/4/3.
//  Copyright © 2019 lly. All rights reserved.
//

#import "BinaryTree.h"

static int maxDis = 0;

typedef struct BTree {
    NSInteger data;
    struct BTree *left;
    struct BTree *right;
}BTree;

@implementation BinaryTree

- (instancetype)init
{
    self = [super init];
    if (self) {
                    //建立一颗如下的二叉树
                    /*
                     
                                    1
                              2           3
                          4      5     #     6
                        #   7  8   9
                     
                    */
//        NSArray *array = @[@1,@2,@3,@4,@5,@"#",@6,@"#",@7,@8,@9];
//        BTree *root = [self createBTreeFromArray:array index:0];

//        NSArray *array2 = @[@1,@2,@3];
//        BTree *root2 = [self createBTreeFromArray:array2 index:0];
        
        //二叉树的遍历
        
        //节点数
//        NSInteger nodes = [self btreeNodeCount:root];
//        NSLog(@"nodes = %ld",(long)nodes);
        
        //前序遍历
//        [self btreePreOrder:root];
        //中序遍历
//        [self btreeInOrder:root];
        //后序遍历
//        [self btreePostOrder:root];
        
        //二叉树的深度
//        NSInteger deep = [self btreeDeep:root];
//        NSLog(@"deep = %ld",(long)deep);
        
        //二叉树的翻转
//        BTree *reverseTree = [self btreeReverse:root];
//        [self btreePreOrder:reverseTree];
        
        //判断相似
//        BOOL isSame = [self btreeIsSame:root root2:root2];
//        NSLog(@"isSame = %d",isSame);
        
        //分层遍历
//        [self btreeLeafOrder:root];
        
        //第K层的节点数
//        NSInteger count = [self btreeFloorCount:root floor:3];
//        NSLog(@"count = %ld",(long)count);
        
        //叶子节点数
//        NSInteger leafCount = [self btreeLeafCount:root];
//        NSLog(@"leafCount = %ld",leafCount);
        
        //公共祖先
//        NSInteger node1 = 5,node2 = 7;
//        NSInteger parent = [self btreeCommonParent:root node1:node1 node2:node2];
//        NSLog(@"node1 = %ld,node2 = %ld,parent = %ld",node1,node2,parent);
        
        //最大距离
//        [self btreeMaxDistance:root];
//        NSLog(@"maxDis = %d",maxDis);
                
    }
    return self;
}

- (BTree *)createBTreeFromArray:(NSArray *)array index:(NSInteger)idx{
    
    BTree *root = NULL;
    
    if (idx >= array.count) {
        return NULL;
    }
    
    id item = array[idx];
    
    if ([item isKindOfClass:[NSString class]]) {
        root = NULL;
    }
    else{
        root = (struct BTree *)malloc(sizeof(struct BTree));
        root->data = [item integerValue];
        root->left = [self createBTreeFromArray:array index:2*idx+1];
        root->right = [self createBTreeFromArray:array index:2*idx+2];
    }
    
    return root;
    
}

- (NSInteger)btreeNodeCount:(BTree *)root{
    
    if (!root) {
        return 0;
    }
    return [self btreeNodeCount:root->left] + [self btreeNodeCount:root->right] + 1;
    
}

- (void)btreePreOrder:(BTree *)root{
    
    if (!root) {
        return;
    }
    
    NSLog(@"%ld",(long)root->data);
    [self btreePreOrder:root->left];
    [self btreePreOrder:root->right];
}

- (void)btreeInOrder:(BTree *)root{
    
    if (!root) {
        return;
    }
    
    [self btreeInOrder:root->left];
    NSLog(@"%ld",(long)root->data);
    [self btreeInOrder:root->right];
}

- (void)btreePostOrder:(BTree *)root{
    
    if (!root) {
        return;
    }
    
    [self btreePostOrder:root->left];
    [self btreePostOrder:root->right];
    NSLog(@"%ld",(long)root->data);
    
}

- (NSInteger)btreeDeep:(BTree *)root{
    
    if (!root) {
        return 0;
    }
    else{
        return MAX([self btreeDeep:root->left] + 1, [self btreeDeep:root->right] + 1);
    }
    
}

- (BTree *)btreeReverse:(BTree *)root{
    
    if (!root) {
        return NULL;
    }
    
    if (!root->left && !root->right) {
        return root;
    }
    
    BTree *leftNode = [self btreeReverse:root->left];
    BTree *rightNode = [self btreeReverse:root->right];
    
    root->left = rightNode;
    root->right = leftNode;
    
    return root;
}

- (BOOL)btreeIsSame:(BTree *)root1 root2:(BTree *)root2{
    
    if (root1 == NULL && root2 == NULL) {
        return YES;
    }
    
    if (root1 == NULL || root2 == NULL) {
        return NO;
    }
    
    return ([self btreeIsSame:root1->left root2:root2->left] && [self btreeIsSame:root1->right root2:root2->right]);
    
}

- (void)btreeLeafOrder:(BTree *)root{
    
    NSMutableArray *queue = [NSMutableArray array];
    
    NSInteger curFloorNode = 0,nextNode = 1;
    
    while (queue.count > 0 || root) {
        
        NSLog(@"%ld",(long)root->data);
        
        if (root->left) {
            [queue addObject:[NSValue value:root->left withObjCType:@encode(struct BTree)]];
            curFloorNode++;
        }
        
        if (root->right) {
            [queue addObject:[NSValue value:root->right withObjCType:@encode(struct BTree)]];
            curFloorNode++;
        }
        
        if (queue.count > 0) {
            struct BTree tmp;
            [[queue objectAtIndex:0] getValue:&tmp];
            root = &tmp;
            [queue removeObjectAtIndex:0];
            
            nextNode--;
            
            if (nextNode == 0) {
                NSLog(@"\n");
                nextNode = curFloorNode;
                curFloorNode = 0;
            }
        }
        else{
            return;
        }
    }
    
}

- (NSInteger)btreeFloorCount:(BTree *)root floor:(NSInteger)floor{
    
    if (!root || floor < 1) {
        return 0;
    }
    
    //!!!
    if (floor == 1) {
        return 1;
    }
    
    return [self btreeFloorCount:root->left floor:floor-1] + [self btreeFloorCount:root->right floor:floor-1];
    
}

- (NSInteger)btreeLeafCount:(BTree *)root{
    
    if (!root) {
        return 0;
    }
    
    if (!root->left && !root->right) {
        return 1;
    }
    
    return [self btreeLeafCount:root->left] + [self btreeLeafCount:root->right];
    
}

- (BOOL)btreePath:(BTree *)root node:(NSInteger)node path:(NSMutableArray *)path{
    
    if (root && root->data == node) {
        [path addObject:@(root->data)];
        return YES;
    }
    
    if (!root) {
        return NO;
    }
    
    [path addObject:@(root->data)];
    
    BOOL found = [self btreePath:root->left node:node path:path];
    if (!found) {
        found = [self btreePath:root->right node:node path:path];
    }
    
    if (!found) {
        [path removeLastObject];
    }
    
    return found;
    
}

- (NSInteger)btreeCommonParent:(BTree *)root node1:(NSInteger)node1 node2:(NSInteger)node2{
    
    NSMutableArray *path1 = [NSMutableArray array];
    NSMutableArray *path2 = [NSMutableArray array];
    BOOL node1Found = [self btreePath:root node:node1 path:path1];
    BOOL node2Found = [self btreePath:root node:node2 path:path2];
    
    if (!node1Found || !node2Found) {
        return NSNotFound;
    }
    
    NSInteger length = MIN(path1.count, path2.count);
    
    for (NSInteger i = 0;i < length;i++) {
        if ([path1[i] integerValue] != [path2[i] integerValue] && i > 0) {
            //返回最后一个相等的节点
            return [path1[i-1] integerValue];
        }
    }
    return NSNotFound;
    
}


- (int)btreeMaxDistance:(BTree *)root{
    
    if (!root) {
        return 0;
    }
    
    int leftDis = [self btreeMaxDistance:root->left];
    int rightDis = [self btreeMaxDistance:root->right];
    
    int lrDis = leftDis + rightDis;
    maxDis = MAX(lrDis, maxDis);
    
    return MAX(leftDis+1,rightDis+1);
}

@end
