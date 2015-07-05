//
//  Matrix.m
//  task_1
//
//  Created by Mike on 7/5/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "Matrix.h"
#import "NSObject+protected.h"

@implementation Matrix

@synthesize data;
@synthesize dataResult;
@synthesize delegate;

- (instancetype) initWithRandomDataForSize:(NSInteger)size
{
    if ([super init]) {
        for (int i=0; i<size; i++) {
            NSMutableArray *row = [[NSMutableArray alloc]init];
            for (int j=0; j<size; j++) {
                [row addObject:@(arc4random()%30)];
            }
            [self.data addObject:row];
        }
    }
    return self;
}

- (void) mullMatrix:(NSMutableArray *)firstMatrix bySecondMatrix:(NSMutableArray *)secondMatrix
{
   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSInteger buferData = 0;
        NSMutableArray *newArrayRow;
        self.dataResult = [[NSMutableArray alloc] init];
        for (int i=0; i<self.data.count; i++) {
            NSArray *rowFirst = firstMatrix[i];
            newArrayRow = [[NSMutableArray alloc] init];
            buferData = 0;
            for (int j=0; j<self.data.count; j++) {
                for (int k=0; k<self.data.count; k++) {
                    NSInteger dataFirst = [rowFirst[k] integerValue];
                    NSArray *rowSecond = secondMatrix[k];
                    NSInteger dataSecond = [rowSecond[j] integerValue];
                    buferData+=dataFirst*dataSecond;
                }
                [newArrayRow addObject:@(buferData)];
            }
            [self.dataResult addObject:newArrayRow];
        }
        [self finishMullOperation];
    //});
}

- (void) mullMatrix:(NSMutableArray *)matrix byVector:(NSMutableArray *)vector
{
    
  //  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSInteger buferData = 0;
        self.dataResult = [[NSMutableArray alloc] init];
        for (int i=0; i<matrix.count; i++) {
            NSArray *row = matrix[i];
            buferData = 0;
            for (int j=0; j<matrix.count; j++) {
                NSInteger dataFirst = [row[j] integerValue];
                NSInteger dataSecond = [vector[j] integerValue];
                buferData+=dataFirst*dataSecond;
            }
            [self.dataResult addObject:@(buferData)];
        }
        [self finishMullOperation];
   // });
}

- (void) finishMullOperation
{
   // dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(finishedMullOperation)]) {
            [self.delegate finishedMullOperation];
        }
    //});
}

@end
