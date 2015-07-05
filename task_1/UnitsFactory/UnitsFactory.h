//
//  UnitsFactory.h
//  task_1
//
//  Created by Mike on 7/4/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import "AgilityUnit.h"
#import "ProtectionUnit.h"
#import "DamageUnit.h"
#import "RegenerationUnit.h"

@interface UnitsFactory : NSObject

- (Warrior*) createRandomUnitWithType:(WariorType)type andDelegate:(id)delegate;
- (NSMutableArray*) getArrayOfWariorsWithType:(NSArray*)wariorTypeArray andDelegate:(id)delegate;
- (Warrior*)createRandomUnitWithType:(WariorType)type andHealth:(float)health andDamage:(float)damage andDelegate:(id)delegate;

@end
