//
//  WarriorBase.h
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WariorType) {
    Damage,
    Regeneration,
    Protection,
    Agility
};

@protocol UnitsDelegate <NSObject>

- (void) removeDeadUnit:(id)unit;
- (void) refillHealthMessage:(NSString*)message fromWarrior:(id)warrior;
- (void) attackMessage:(NSString*)message fromWarrior:(id)warrior;
- (void) attackedMessage:(NSString*)message fromWarrior:(id)warrior;

@end

@interface Warrior : NSObject

@property (copy, nonatomic) NSString *name;
@property (weak, nonatomic) id<UnitsDelegate> delegate;

@property (assign, nonatomic) float hitPointsLimit;
@property (assign, nonatomic) float unitDamage;
@property (assign, nonatomic) float hitPoints;
@property (assign, nonatomic) WariorType wariorType;

- (float) attack;
- (instancetype) initUnitWithHealth:(float)hitPointsLimit andDamage:(float)damage andWariorType:(WariorType) type;
- (void) refillHealth;
- (void) getDamage:(float)damage;
- (void) setUnitName:(NSString*)name;
- (void) ability;
- (float) counterattack;
+ (NSString*)getUnitType:(WariorType)type;

@end


