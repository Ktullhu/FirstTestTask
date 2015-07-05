//
//  OperationsShow.m
//  task_1
//
//  Created by Mike on 7/5/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "OperationsShow.h"

@implementation OperationsShow

- (void) show
{
    Matrix *firstMatrix = [[Matrix alloc] initWithRandomDataForSize:30];
    firstMatrix.delegate = self;
    Matrix *secondMatrix = [[Matrix alloc] initWithRandomDataForSize:30];
    secondMatrix.delegate = self;
    Vector *firstVector = [[Vector alloc] initWithRandomDataForSize:30];
    firstVector.delegate = self;
    Vector *secondVector = [[Vector alloc] initWithRandomDataForSize:30];
    secondMatrix.delegate = self;
    Matrix *thirdMatrix = [[Matrix alloc] initWithRandomDataForSize:40];
    thirdMatrix.delegate = self;
    Vector *thirdVector = [[Vector alloc] initWithRandomDataForSize:40];
    thirdVector.delegate = self;
    [firstMatrix mullMatrix:firstMatrix.data bySecondMatrix:secondMatrix.data];
   // [firstVector mullVector:firstVector.data bySecondVector:secondVector.data];
    //[thirdMatrix mullMatrix:thirdMatrix.data byVector:thirdVector.data];
}


- (void) finishedMullOperation
{
    NSLog(@"mull operation is finished");
}

@end
