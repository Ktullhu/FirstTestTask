//
//  WarriorBase.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

- (instancetype) initUnitWithHealth:(float)hitPointsLimit andDamage:(float)damage andWariorType:(WariorType) type
{
    if ([super init]) {
        self.hitPointsLimit = hitPointsLimit;
        self.unitDamage = damage;
        self.hitPoints = hitPointsLimit;
        self.wariorType = type;
    }
    return self;
}

- (float) attack
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(attackMessage:fromWarrior:)]) {
        [self.delegate refillHealthMessage:[NSString stringWithFormat:@" attack warrior with %f points", self.unitDamage] fromWarrior:self];
    }
    return self.unitDamage;
}

- (void) refillHealth
{
    if (self.hitPoints != self.hitPointsLimit) {
        float refillHealth = (self.hitPointsLimit - self.hitPoints) / 2;
        self.hitPoints += refillHealth;
        if (self.delegate && [self.delegate respondsToSelector:@selector(refillHealthMessage:fromWarrior:)]) {
            [self.delegate refillHealthMessage:[NSString stringWithFormat:@" refill health with %f points", refillHealth] fromWarrior:self];
        }
    }
}

- (void) getDamage:(float)damage
{
    self.hitPoints -= damage;
    
    float hitPoints = (self.hitPoints <= 0) ? 0 : self.hitPoints;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(attackedMessage:fromWarrior:)]) {
        [self.delegate refillHealthMessage:[NSString stringWithFormat:@" was attacked with %f points and have %f life points", damage, hitPoints] fromWarrior:self];
    }
    if (!hitPoints && self.delegate && [self.delegate respondsToSelector:@selector(removeDeadUnit:)]) {
        [self.delegate removeDeadUnit:self];
    }
}

- (float) counterattack
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(attackMessage:fromWarrior:)]) {
        [self.delegate refillHealthMessage:[NSString stringWithFormat:@" counterattack warrior with %f points", self.unitDamage / 2] fromWarrior:self];
    }
    return self.unitDamage / 2;
}

- (void) setUnitName:(NSString *)name
{
    self.name = name;
}

+ (NSString*)getUnitType:(WariorType)type
{
    switch (type) {
        case Agility:
            return @"AgilityUnit";
        case Regeneration:
            return @"RegenerationUnit";
        case Protection:
            return @"ProtectionUnit";
        case Damage:
            return @"DamageUnit";
        default:
            return nil;
    }
}

- (void) ability
{
    
}



@end
