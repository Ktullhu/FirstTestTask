//
//  main.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "OperationsShow.h"
#import "Triangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool{

        Game *game = [[Game alloc] init];
        [game startGame];
        
        Triangle *triange = [[Triangle alloc] initTriangleWithFirstPoint:CGPointMake(1, 1) secondPoint:CGPointMake(3, 3) andThirdPoint:CGPointMake(5, 0)];
        if ([triange checkPointInside:CGPointMake(3, 1)]) {
            NSLog(@"inside triangle");
        } else {
            NSLog(@"Not inside");
        }
        
        OperationsShow *operations = [[OperationsShow alloc] init];
        [operations show];

        
    }
    return 0;
}
