//
//  Game.m
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "Game.h"
#import "UnitsFactory.h"

@interface Game() <UnitsDelegate>

@property (strong, nonatomic) NSMutableArray *warriorsArray;
@property (strong, nonatomic) UnitsFactory *factory;
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation Game

- (void)startGame
{
    self.factory = [[UnitsFactory alloc] init];
    [self createUnits];
    [self warriorsInfo];
    [self startFighting];
}

- (void) warriorsInfo
{
    for (Warrior *warrior in self.warriorsArray) {
        NSLog(@"Name:%@", [self getNameOrIndexWarrior:warrior]);
        NSLog(@"Health:%f", warrior.hitPointsLimit);
        NSLog(@"Damage:%f", warrior.unitDamage);
        NSLog(@"Type:%@",[Warrior getUnitType:warrior.wariorType]);
        NSLog(@"______________________________________________");
    }
}

- (void) createUnits
{
    self.warriorsArray = [self.factory getArrayOfWariorsWithType:@[@(Agility), @(Protection), @(Damage), @(Regeneration), @(Damage), @(Protection)] andDelegate:self];
}

- (void) startFighting
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.f target:self selector:@selector(fight:) userInfo:nil repeats:YES];
  //  [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
   [self.timer fire];
}

- (void) fight:(NSTimer *)timer
{
    NSInteger attackWarriorIndex = arc4random()%[self.warriorsArray count];
    NSInteger attackedWarriorIndex;
    do{
        attackedWarriorIndex = arc4random()%[self.warriorsArray count];
        
    } while (attackedWarriorIndex == attackWarriorIndex);
    Warrior *attackWarrior = self.warriorsArray[attackWarriorIndex];
    float damage = [attackWarrior attack];
    Warrior *attackedWarrior = self.warriorsArray[attackedWarriorIndex];
    [attackedWarrior getDamage:damage];
    
    if (attackedWarrior.hitPoints > 0) {
        [attackWarrior getDamage:[attackedWarrior counterattack]];
    }
    
    if (arc4random() % 2) {
        [self refillHealth];
    }
    
    if (self.warriorsArray.count == 1) {
        [timer invalidate];
        timer = nil;
        [self getWinner:self.warriorsArray.firstObject];
    }
    [NSThread sleepForTimeInterval:1.0f];
    [self.timer fire];
}

- (void) getWinner:(Warrior *)warrior
{

    NSLog(@"%@ is winner", [self getNameOrIndexWarrior:warrior]);
}

- (void) refillHealth
{
    NSInteger healthFillWarriorIndex = arc4random()%[self.warriorsArray count];
    Warrior *healthFillWarrior = self.warriorsArray[healthFillWarriorIndex];
    [healthFillWarrior refillHealth];
}

- (NSString*) getNameOrIndexWarrior:(Warrior*)warrior
{
    if (warrior.name) {
        return warrior.name;
    } else {
        return [NSString stringWithFormat:@"warrior with index %li",[self.warriorsArray indexOfObject:warrior]];
    }
}

#pragma marh - UnitDeleage

- (void) removeDeadUnit:(id)unit
{
    Warrior *deadWarrior = unit;
    NSLog(@"%@ is dead", [self getNameOrIndexWarrior:deadWarrior]);
    
    [self.warriorsArray removeObject:unit];
}

- (void) refillHealthMessage:(NSString*)message fromWarrior:(id)warrior
{
    Warrior *unit = warrior;
    NSLog(@"%@%@",[self getNameOrIndexWarrior:unit],message);
}

- (void) attackMessage:(NSString *)message fromWarrior:(id)warrior
{
    Warrior *unit = warrior;
    NSLog(@"%@%@",[self getNameOrIndexWarrior:unit],message);
}

- (void) attackedMessage:(NSString *)message fromWarrior:(id)warrior
{
    Warrior *unit = warrior;
    NSLog(@"%@%@",[self getNameOrIndexWarrior:unit],message);
}

@end
