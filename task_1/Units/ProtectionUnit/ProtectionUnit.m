//
//  ProtectionUnit.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "ProtectionUnit.h"

@implementation ProtectionUnit

- (void)getDamage:(float)damage
{
    if (arc4random() % 3 == 2) {
        self.hitPoints -=(damage * 0.75);
        if ( self.hitPoints <= 0) {
            self.hitPoints = 1;
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(attackedMessage:fromWarrior:)]) {
            [self.delegate refillHealthMessage:[NSString stringWithFormat:@" was attacked with %f points and have %f life points", damage, self.hitPoints] fromWarrior:self];
        }
    } else {
        [super getDamage:damage];
    }

}


@end
