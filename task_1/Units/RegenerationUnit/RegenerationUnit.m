//
//  RegenerationUnit.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "RegenerationUnit.h"

@implementation RegenerationUnit

- (void) refillHealth
{
    if (arc4random() % 3 == 2) {
        if (self.hitPoints != self.hitPointsLimit) {
            float refillHealth = (self.hitPointsLimit - self.hitPoints) * 0.9;
            self.hitPoints += refillHealth;
            if (self.delegate && [self.delegate respondsToSelector:@selector(refillHealthMessage:fromWarrior:)]) {
                [self.delegate refillHealthMessage:[NSString stringWithFormat:@" refill health with %f points (ABILITY)", refillHealth] fromWarrior:self];
            }
        }
    } else {
        [super refillHealth];
    }
}

@end
