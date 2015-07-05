//
//  Vector.m
//  task_1
//
//  Created by Mike on 7/5/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "Vector.h"
#import "NSObject+protected.h"

@implementation Vector

@synthesize data;
@synthesize dataResult;
@synthesize delegate;

- (instancetype) initWithRandomDataForSize:(NSInteger)size
{
    if ([super init]) {
        self.data = [[NSMutableArray alloc] initWithCapacity:size];
        for (int i=0; i<size; i++) {
            self.data[i] = @(arc4random() % 30);
        }
    }
    return self;
}

- (void) mullVector:(NSMutableArray *)vector bySecondVector:(NSMutableArray *)secondVector
{
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.dataResult = [[NSMutableArray alloc] initWithCapacity:vector.count];
        for (int i=0; i<vector.count; i++) {
            dataResult[i] = @([vector[i] integerValue] * [vector[i] integerValue]);
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
  //  });

}

- (void) addVector:(NSMutableArray *)vector bySecondVector:(NSMutableArray *)secondVector
{
   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    self.dataResult = [[NSMutableArray alloc] initWithCapacity:vector.count];
    for (int i=0; i<vector.count; i++) {
        dataResult[i] = @([vector[i] integerValue] + [vector[i] integerValue]);
    }
    [self finishMullOperation];
  //  });
}

@end
