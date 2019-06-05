//
//  BST.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/6/3.
//  Copyright © 2019 lly. All rights reserved.
//

#import "BST.h"

typedef struct BTree {
    NSInteger data;
    struct BTree *left;
    struct BTree *right;
}BTree;

@interface BST ()



@end

@implementation BST{
    BTree *_p;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _p = NULL;
        
        BTree *root = (BTree *)malloc(sizeof(BTree));
        root->data = 87;
        root->left = NULL;
        root->right = NULL;

        NSArray *array = @[@66,@45,@37,@39,@53,@90,@89,@99,@91];
        for (NSNumber *num in array) {
            [self insertBST:root node:[num integerValue]];
        }
        
        [self btreePreOrder:root];
        NSLog(@"-----------------------------");
        [self btreeInOrder:root];
        
        [self deleteBST:root node:90];
        NSLog(@"-----------------------------");
        [self btreeInOrder:root];
        
    }
    return self;
}

- (BOOL)search:(BTree *)root node:(NSInteger)node{
    
    if (!root) {
        return NO;
    }
    
    if (root->data == node) {
        return YES;
    }
    
    if (root->left == NULL && root->data > node){
        _p = root;
    }
    
    if (root->right == NULL && root->data < node) {
        _p = root;
    }
    
    if (root->data > node) {
        return [self search:root->left node:node];
    }else {
        return [self search:root->right node:node];
    }
    
}

- (void)insertBST:(BTree *)root node:(NSInteger)node{
    
    if ([self search:root node:node] || !root) {
        return;
    }
    
    BTree *n = (BTree *)malloc(sizeof(BTree));
    n->data = node;
    n->left = NULL;
    n->right = NULL;
    
    if (!_p) {
        _p = n;
    }
    
    if (_p->data < node) {
        _p->right = n;
    }
    else{
        _p->left = n;
    }
}

- (void)deleteBST:(BTree *)root node:(NSInteger)node{
    
    BTree *parent = root;
    BTree *current = root;
    bool isLeft = YES;
    while (current->data != node) {
        parent = current;
        if (current->data > node) {
            current = current->left;
            isLeft = YES;
        }
        else{
            current = current->right;
            isLeft = NO;
        }
    }
    
    //如果没有找到该节点
    if (current->data != node) {
        return;
    }
    
    //分3种情况
    //1.叶子节点，既没有左子树也没有右子树
    if (current->left == NULL && current->right == NULL) {
        
        free(current);
        
        if (isLeft) {
            parent->left = NULL;
        }
        else{
            parent->right = NULL;
        }
    }else if (current->left == NULL) {
    //2.只有左子树或者右子树
        BTree *right = current->right;
        if (isLeft) {
            parent->left = right;
        }
        else{
            parent->right = right;
        }
    }
    else if (current->right == NULL){
        BTree *left = current->left;
        if (isLeft) {
            parent->left = left;
        }
        else{
            parent->right = left;
        }
        
    }else{
    //3.既有左子树又有右子树
        //先找该节点的前驱或者后继节点
        BTree *succeedNode = [self deleteSucceedNode:current->right];
        BTree *left = current->left;
        BTree *right = current->right;
        
        if (isLeft) {
            parent->left = succeedNode;
        }
        else{
            parent->right = succeedNode;
        }
        succeedNode->left = left;
        succeedNode->right = right;
    }
    
}

- (BTree *)deleteSucceedNode:(BTree *)deleteNode{
    
    //后继节点是右子树中最小的节点 所以一定在最左边。
    BTree *succeedNode = deleteNode;
    BTree *parent = succeedNode;
    while (succeedNode->left) {
        parent = succeedNode;
        succeedNode = succeedNode->left;
    }
    
    //如果后继有有右节点 需要转树.
    if (succeedNode->right) {
        parent->left = succeedNode->right;
    }
    
    parent->left = NULL;
    
    succeedNode->left = NULL;
    succeedNode->right = NULL;
    
    return succeedNode;
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

@end
