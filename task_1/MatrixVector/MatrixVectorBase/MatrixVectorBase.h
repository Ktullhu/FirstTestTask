//
//  MatrixVectorBase.h
//  task_1
//
//  Created by Mike on 7/5/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FinishOpreationDelegate <NSObject>

- (void) finishedMullOperation;

@end

@protocol MatrixVectorBase <NSObject>

@property (strong, nonatomic) NSMutableArray* data;
@property (strong, nonatomic) NSMutableArray* dataResult;
@property (weak, nonatomic) id<FinishOpreationDelegate> delegate;

- (instancetype) initWithRandomDataForSize:(NSInteger)size;
@optional
- (void) mullMatrix:(NSMutableArray*)firstMatrix bySecondMatrix:(NSMutableArray*)secondMatrix;
- (void) mullMatrix:(NSMutableArray*)matrix byVector:(NSMutableArray*)vector;
- (void) mullVector:(NSMutableArray*)vector bySecondVector:(NSMutableArray*)secondVector;

@end
