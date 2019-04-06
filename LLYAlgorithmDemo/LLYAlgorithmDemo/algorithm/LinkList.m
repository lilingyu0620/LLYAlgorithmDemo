//
//  LinkList.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2019/4/4.
//  Copyright © 2019 lly. All rights reserved.
//

#import "LinkList.h"

typedef struct LinkNode {
    NSInteger data;
    struct LinkNode *next;
}LinkNode;

@implementation LinkList

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        LinkNode *head1 = [self createWithArray:@[@1,@2,@3,@4,@5,@6,@7,@8,@9]];
        //遍历
        [self printLinkList:head1];
        
        NSLog(@"------------------------------------------------------------");
        
        //相交链表
//        LinkNode *head2 = [self attachLinkList:head1->next->next->next->next];
//        [self printLinkList:head2];
//        //求相交点
//        LinkNode *crossNode = [self hasCross:head1 head2:head2];
//        NSLog(@"相交节点是 %ld",crossNode->data);
        
        //环形链表
//        LinkNode *head2 = head1;
//        [self circleLinkList:head2];
//        [self printCircleLinkList:head2];
//        BOOL isCircle = [self isCircleLinkList:head2];
//        NSLog(@"判断是否有环 %d",isCircle);
//        LinkNode *circleNode = [self circleNodeLinkList:head2];
//        NSLog(@"环起点是 %ld",(long)circleNode->data);
        
        //翻转链表
//        LinkNode *reverseHead = [self reverseLinkList:head1];
//        [self printLinkList:reverseHead];
        
        //随机节点
        LinkNode *node1 = [self randomNode:head1];
        LinkNode *node2 = [self randomNode:head1];
        LinkNode *node3 = [self randomNode:head1];
        LinkNode *node4 = [self randomNode:head1];
        NSLog(@"node1 = %ld,node2 = %ld,node3 = %ld,node4 = %ld",node1->data,node2->data,node3->data,node4->data);
        
    }
    return self;
}

- (LinkNode *)createWithArray:(NSArray *)array{
    
    LinkNode *head = NULL;
    LinkNode *tmp = NULL;
    
    for (int i = 0; i < array.count; i++) {
        
        LinkNode *node = (struct LinkNode *)malloc(sizeof(struct LinkNode));
        node->data = [array[i] integerValue];
        node->next = NULL;
        
        if (i == 0) {
            head = node;
            tmp = head;
        }
        else{
            if (tmp) {
                tmp->next = node;
                tmp = node;
            }
        }
    }
    return head;
}

- (void)printLinkList:(LinkNode *)head{
    
    LinkNode *h = head;
    while (h) {
        NSLog(@"%ld",h->data);
        h = h->next;
    }
}

- (LinkNode *)attachLinkList:(LinkNode *)head{
    
    LinkNode *tmp = NULL;
    LinkNode *h = NULL;

    for (int i = 10; i < 15; i++) {
        
        LinkNode *node = (struct LinkNode *)malloc(sizeof(struct LinkNode));
        node->data = i;
        node->next = NULL;

        if (i == 10) {
            h = node;
            tmp = h;
        }
        else{
            if (tmp) {
                tmp->next = node;
                tmp = node;
            }
        }
    }
    
    if (tmp) {
        tmp->next = head;
    }
    
    return h;
    
}

- (LinkNode *)hasCross:(LinkNode *)head1 head2:(LinkNode *)head2{
    
    NSMutableArray *array1 = [NSMutableArray array];
    NSMutableArray *array2 = [NSMutableArray array];
    
    LinkNode *h1 = head1;
    LinkNode *h2 = head2;
    while (h1) {
        [array1 addObject:[NSValue value:h1 withObjCType:@encode(struct LinkNode)]];
        h1 = h1->next;
    }
    while (h2) {
        [array2 addObject:[NSValue value:h2 withObjCType:@encode(struct LinkNode)]];
        h2 = h2->next;
    }
    
    NSInteger length = MIN(array1.count, array2.count);
    
    while (length > 0) {
        
        LinkNode hh1;
        [[array1 lastObject] getValue:&hh1];
        h1 = &hh1;
        
        LinkNode hh2;
        [[array2 lastObject] getValue:&hh2];
        h2 = &hh2;
        
        if (h1->data == h2->data) {
            [array1 removeLastObject];
            [array2 removeLastObject];
            continue;
        }
        else{
            return h1->next;
        }
    }
    
    return NULL;
    
}

- (void)circleLinkList:(LinkNode *)head{
    
    LinkNode *h = head;
    while (h->next) {
        h = h->next;
    }
    
    h->next = head->next->next->next;
}

- (void)printCircleLinkList:(LinkNode *)head{
    
    //最多打印30个节点
    NSInteger times = 30;
    LinkNode *h = head;
    while (h && times > 0) {
        NSLog(@"%ld",h->data);
        times--;
        h = h->next;
    }
}

- (BOOL)isCircleLinkList:(LinkNode *)head{
    
    LinkNode *step1 = head->next;
    LinkNode *step2 = head->next->next;
    
    while (step1 && step2) {
        
        if (step1 == step2) {
            return YES;
        }
        
        step1 = step1->next;
        if (step2->next) {
            step2 = step2->next->next;
        }
        else{
            step2 = NULL;
        }
    }
    
    return NO;
}

- (LinkNode *)circleNodeLinkList:(LinkNode *)head{
    
    LinkNode *h = head;
    LinkNode *step1 = head->next;
    LinkNode *step2 = head->next->next;
    
    while (step1 && step2) {
        
        if (step1 == step2) {
            break;
        }
        
        step1 = step1->next;
        step2 = step2->next->next;
    }
    
    if (step1 != step2) {
        return NULL;
    }
    
    while (h != step1) {
        h = h->next;
        step1 = step1->next;
    }
    
    return h;
}

- (LinkNode *)reverseLinkList:(LinkNode *)head{
    
    LinkNode *p = head,*q = head->next,*r = head->next->next;

    p->next = NULL;

    while (r) {
        q->next = p;
        p = q;
        q = r;
        r = r->next;
    }
    
    q->next = p;
    
    return q;
}

- (LinkNode *)randomNode:(LinkNode *)head{
    
    NSInteger length = 0;
    LinkNode *h = head;
    while (h) {
        length++;
        h = h->next;
    }
    
    NSInteger random = arc4random()%length;
    h = head;
    
    while (random > 0 && h) {
        random--;
        h = h->next;
    }
    
    return h;
}

@end
