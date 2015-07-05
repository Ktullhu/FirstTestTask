//
//  Triangle.m
//  task_1
//
//  Created by Mike on 7/5/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "Triangle.h"

@interface Triangle()

@property (assign, nonatomic) CGPoint firstPoint;
@property (assign, nonatomic) CGPoint secondPoint;
@property (assign, nonatomic) CGPoint thirdPoint;

@end

@implementation Triangle

- (instancetype) initTriangleWithFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint andThirdPoint:(CGPoint) topPoint
{
    if ([super init]) {
        self.firstPoint = firstPoint;
        self.secondPoint = secondPoint;
        self.thirdPoint = topPoint;
    }
    return self;
}

- (BOOL)checkPointInside:(CGPoint)point
{
    int aPart = (self.firstPoint.x - point.x) * (self.secondPoint.y - self.firstPoint.y) - (self.secondPoint.x - self.firstPoint.x) * (self.firstPoint.y - point.y);
    int bPart = (self.secondPoint.x - point.x) * (self.thirdPoint.y - self.secondPoint.y) - (self.thirdPoint.x - self.secondPoint.x) * (self.secondPoint.y - point.y);
    int cPart = (self.thirdPoint.x - point.x) * (self.firstPoint.y - self.thirdPoint.y) - (self.firstPoint.x - self.thirdPoint.x) * (self.thirdPoint.y - point.y);
    
    if ((aPart < 0 && bPart < 0 && cPart < 0) || (aPart > 0 && bPart > 0 && cPart > 0)) {
        return YES;
    } else {
        return  NO;
    }
}

@end
