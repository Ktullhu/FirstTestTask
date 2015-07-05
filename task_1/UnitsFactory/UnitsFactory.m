//
//  UnitsFactory.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "UnitsFactory.h"

@implementation UnitsFactory

- (Warrior*) createRandomUnitWithType:(WariorType)type andDelegate:(id)delegate
{
    Warrior *warrior;
    float health = [self getRandomNumberBetween:40 to:50];
    float damage = [self getRandomNumberBetween:20 to:30];
    warrior = [[DamageUnit alloc] initUnitWithHealth:health andDamage:damage andWariorType:type];
    warrior.delegate = delegate;
    switch (type) {
        case Protection:
            warrior = [[ProtectionUnit alloc] initUnitWithHealth:health andDamage:damage andWariorType:type];
            warrior.delegate = delegate;
            return warrior;
        case Agility:
            warrior = [[AgilityUnit alloc] initUnitWithHealth:health andDamage:damage andWariorType:type];
            warrior.delegate = delegate;
            return warrior;
        case Regeneration:
            warrior = [[RegenerationUnit alloc] initUnitWithHealth:health andDamage:damage andWariorType:type];
            warrior.delegate = delegate;
            return warrior;
        default:
            warrior = [[DamageUnit alloc] initUnitWithHealth:health andDamage:damage andWariorType:type];
            warrior.delegate = delegate;
            return warrior;
    }
}

- (NSMutableArray*) getArrayOfWariorsWithType:(NSArray*)wariorTypeArray andDelegate:(id)delegate
{
    NSMutableArray *warriors = [[NSMutableArray alloc] init];
    for (NSNumber *type in wariorTypeArray) {
        WariorType warriorType = [type integerValue];
        Warrior *warrior = [self createRandomUnitWithType:warriorType andDelegate:delegate];
        warrior.name = [NSString stringWithFormat:@"%li",[self getRandomNumberBetween:0 to:900]];
        [warriors addObject:warrior];
    }
    return warriors;
}

- (Warrior*)createRandomUnitWithType:(WariorType)type andHealth:(float)health andDamage:(float)damage andDelegate:(id)delegate
{
    Warrior *warrior;
    warrior = [[Warrior alloc] initUnitWithHealth:health andDamage:damage andWariorType:type];
    warrior.delegate = delegate;
    switch (type) {
        case Protection:
            return (ProtectionUnit*)warrior;
            break;
        case Agility:
            return (AgilityUnit*)warrior;
        case Regeneration:
            return (RegenerationUnit*)warrior;
            break;
        default:
            return (DamageUnit*)warrior;
    }
}

-(NSInteger)getRandomNumberBetween:(NSInteger)from to:(NSInteger)to {
    
    return from + arc4random() % (to-from+1);
}

@end
