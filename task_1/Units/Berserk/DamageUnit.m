//
//  Berserk.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "DamageUnit.h"

@implementation DamageUnit

- (float) attack
{
    if (arc4random() % 3 == 2) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(attackMessage:fromWarrior:)]) {
            [self.delegate refillHealthMessage:[NSString stringWithFormat:@" attack warrior with %f points (ABILITY)", self .unitDamage * 1.9] fromWarrior:self];
        }
        return self.unitDamage * 1.9;
    } else {
        return [super attack];
    }
}

@end
