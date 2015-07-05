//
//  AgilityUnit.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "AgilityUnit.h"

@interface AgilityUnit()

@end

@implementation AgilityUnit

- (void)getDamage:(float)damage
{
    if (arc4random() % 10 == 3 && !self.hitPoints) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(attackedMessage:fromWarrior:)]) {
            [self.delegate refillHealthMessage:[NSString stringWithFormat:@" dodged the attack (ABILITY)"] fromWarrior:self];
        }
    } else {
        [super getDamage:damage];
    }
}

@end
