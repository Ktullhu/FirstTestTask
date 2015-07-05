//
//  Triangle.h
//  task_1
//
//  Created by Mike on 7/5/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Triangle : NSObject

- (instancetype) initTriangleWithFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint andThirdPoint:(CGPoint) topPoint;

- (BOOL) checkPointInside:(CGPoint)point;

@end
