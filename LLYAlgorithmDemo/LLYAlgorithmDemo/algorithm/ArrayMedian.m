//
//  ArrayMedian.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/4/12.
//  Copyright © 2018年 lly. All rights reserved.
//


//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//Example 1:
//nums1 = [1, 3]
//nums2 = [2]
//
//The median is 2.0
//Example 2:
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//The median is (2 + 3)/2 = 2.5

//理解题目：找出2个排序数组的中位数


#import "ArrayMedian.h"

@implementation ArrayMedian

- (instancetype)init{
    self = [super init];
    if (self) {
        double median = [self medianArray:@[@1,@3] lenA:2 arrayB:@[@2] lenB:1];
        NSLog(@"median = %.1f",median);
    }
    return self;
}


- (int)findK:(NSArray *)arrayA lengthA:(NSInteger)m arrayB:(NSArray *)arrayB lengthB:(NSInteger)n indexK:(NSInteger)k{
    //保证arrayA长度比arrayB小
    if (m > n) {
        return [self findK:arrayB lengthA:n arrayB:arrayA lengthB:m indexK:k];
    }
    if (m == 0) {
        return [arrayB[k-1] intValue];
    }
    if (k == 1) {
        return MIN([arrayA[0] intValue], [arrayB[0] intValue]);
    }
    long pa,pb;
    pa = MIN(k/2, m);
    pb = k - pa;
    if (arrayA[pa-1] < arrayB[pb -1]) {
        return [self findK:[arrayA subarrayWithRange:NSMakeRange(pa, m-pa)] lengthA:m-pa arrayB:arrayB lengthB:n indexK:k-pa];
    }
    else if (arrayA[pa-1] > arrayB[pb-1]){
        return [self findK:arrayA lengthA:m arrayB:[arrayB subarrayWithRange:NSMakeRange(pb, n-pb)] lengthB:n-pb indexK:k-pb];
    }
    else{
        return [arrayA[pa-1] intValue];
    }
}

- (double)medianArray:(NSArray *)arrayA lenA:(int)m arrayB:(NSArray *)arrayB lenB:(int)n{
    int total = m + n;
    //奇数
    if(total & 0x1){
        return [self findK:arrayA lengthA:m arrayB:arrayB lengthB:n indexK:(total/2 + 1)];
    }
    else{
        return ([self findK:arrayA lengthA:m arrayB:arrayB lengthB:n indexK:total/2] + [self findK:arrayA lengthA:m arrayB:arrayB lengthB:n indexK:total/2 + 1])/2.0;
    }
}

@end
