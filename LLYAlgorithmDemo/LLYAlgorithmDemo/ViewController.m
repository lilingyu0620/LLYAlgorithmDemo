//
//  ViewController.m
//  LLYAlgorithmDemo
//
//  Created by lly on 2018/3/22.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ViewController.h"

#import "TwoSum.h"
#import "BinarySearch.h"
#import "Recurrence.h"
#import "ArrayToSum.h"
#import "MaxSubStr.h"
#import "ArrayMedian.h"
#import "HanoiTower.h"
#import "PalindromicStr.h"
#import "ZigZagStr.h"
#import "ReverseInteger.h"
#import "StringToInteger.h"
#import "RegularExpressionMatching.h"
#import "HeapSort.h"
#import "GenerateParentheses.h"
#import "QuickSort.h"
#import "MergeSort.h"
#import "KMP.h"
#import "ArrayThreeSumZero.h"
#import "PhoneNumToStr.h"
#import "ValidParentheses.h"
#import "LongestValidParentheses.h"
#import "HalfRepeat.h"
#import "MaxMinInArray.h"
#import "SearchinRotatedSortedArray.h"
#import "JosephRing.h"
#import "SearchforaRange.h"
#import "CombinationSum.h"
#import "CombinationSum2.h"
#import "FirstMissingPositive.h"
#import "TrappingRainWater.h"
#import "MultiplyStrings.h"
#import "Permutations.h"
#import "Permutations2.h"
#import "RotateImage.h"
#import "GroupAnagrams.h"
#import "NQueue.h"
#import "SpiralMatrix.h"
#import "JumpGame.h"
#import "MergeIntervals.h"
#import "InsertInterval.h"
#import "PermutationSequence.h"
#import "RotateList.h"
#import "UniquePaths.h"
#import "MinimumPathSum.h"
#import "SetMatrixZeroes.h"
#import "Search2DMatrix.h"
#import "SortColors.h"
#import "MinimumWindowSubstring.h"
#import "Combinations.h"
#import "Subsets.h"
#import "RemoveDuplicates.h"
#import "LargestRectangle.h"
#import "MaximalRectangle.h"
#import "Subsets2.h"
#import "DecodeWays.h"
#import "RestoreIPAddresses.h"
#import "InterleavingString.h"
#import "RotateArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    TwoSum *twoSum = [[TwoSum alloc]init];
//    BinarySearch *binarySearch = [[BinarySearch alloc]init];
//    Recurrence *recurrence = [[Recurrence alloc]init];
//    ArrayToSum *array = [[ArrayToSum alloc]init];
//    MaxSubStr *subStr = [[MaxSubStr alloc]init];
//    ArrayMedian *median = [[ArrayMedian alloc]init];
//    HanoiTower *hanoiTower = [[HanoiTower alloc]init];
//    PalindromicStr *paliStr = [[PalindromicStr alloc]init];
//    ZigZagStr *zigZagStr = [[ZigZagStr alloc]init];
//    ReverseInteger *reverseInter = [[ReverseInteger alloc]init];
//    StringToInteger *strToInt = [[StringToInteger alloc]init];
//    RegularExpressionMatching *regularExpressionMatching = [[RegularExpressionMatching alloc]init];
//    HeapSort *heapSort = [[HeapSort alloc]init];
//    GenerateParentheses *generateParentheses = [[GenerateParentheses alloc]init];
//    QuickSort *quickSort = [[QuickSort alloc]init];
//    MergeSort *mergeSort = [[MergeSort alloc]init];
//    KMP *kmp = [[KMP alloc]init];
//    ArrayThreeSumZero *array = [[ArrayThreeSumZero alloc]init];
//    PhoneNumToStr *phoneNumToStr = [[PhoneNumToStr alloc]init];
//    ValidParentheses *validParentheses = [[ValidParentheses alloc]init];
//    LongestValidParentheses *longestValidParentheses = [[LongestValidParentheses alloc]init];
//    HalfRepeat *halfRepeat = [[HalfRepeat alloc]init];
//    MaxMinInArray *maxMinArray = [[MaxMinInArray alloc]init];
//    SearchinRotatedSortedArray *searchinRotatedSortedArray = [[SearchinRotatedSortedArray alloc]init];
//    JosephRing *josephRing = [[JosephRing alloc]init];
//    SearchforaRange *searchforaRange = [[SearchforaRange alloc]init];
//    CombinationSum *combinationSum = [[CombinationSum alloc]init];
//    CombinationSum2 *combinationSum2 = [[CombinationSum2 alloc]init];
//    FirstMissingPositive *firstMissingPositive = [[FirstMissingPositive alloc]init];
//    TrappingRainWater *trappingRainWater = [[TrappingRainWater alloc]init];
//    MultiplyStrings *multiplyStrings = [[MultiplyStrings alloc]init];
//    Permutations *permutations = [[Permutations alloc]init];
//    Permutations2 *permutations2 = [[Permutations2 alloc]init];
//    RotateImage *rotateImage = [[RotateImage alloc]init];
//    GroupAnagrams *groupAnagrams = [[GroupAnagrams alloc]init];
//    NQueue *nQueue = [[NQueue alloc]init];
//    SpiralMatrix *spiralMatrix = [[SpiralMatrix alloc]init];
//    JumpGame *jumpGame = [[JumpGame alloc]init];
//    MergeIntervals *mergeIntervals = [[MergeIntervals alloc]init];
//    InsertInterval *insertInterval = [[InsertInterval alloc]init];
//    PermutationSequence *permutationSequence = [[PermutationSequence alloc]init];
//    RotateList *rotateList = [[RotateList alloc]init];
//    UniquePaths *uniquePaths = [[UniquePaths alloc]init];
//    MinimumPathSum *minimumPathSum = [[MinimumPathSum alloc]init];
//    SetMatrixZeroes *setMatrixZeroes = [[SetMatrixZeroes alloc]init];
//    Search2DMatrix *search2DMatrix = [[Search2DMatrix alloc]init];
//    SortColors *sortColors = [[SortColors alloc]init];
//    MinimumWindowSubstring *minimumWindowSubstring = [[MinimumWindowSubstring alloc]init];
//    Combinations *combinations = [[Combinations alloc]init];
//    Subsets *subsets = [[Subsets alloc]init];
//    RemoveDuplicates *removeDuplicates = [[RemoveDuplicates alloc]init];
//    LargestRectangle *largestRectangle = [[LargestRectangle alloc]init];
//    MaximalRectangle *maximalRectangle = [[MaximalRectangle alloc]init];
//    Subsets2 *subsets2 = [[Subsets2 alloc]init];
//    DecodeWays *decodeWays = [[DecodeWays alloc]init];
//    RestoreIPAddresses *restoreIPAddresses = [[RestoreIPAddresses alloc]init];
//    InterleavingString *interleavingString = [[InterleavingString alloc]init];
    
    RotateArray *rotateArray = [[RotateArray alloc]init];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
