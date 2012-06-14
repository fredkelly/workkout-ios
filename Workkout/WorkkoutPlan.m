//
//  WorkkoutPlan.m
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import "WorkkoutPlan.h"

@implementation WorkkoutPlan

@synthesize id = _id;
@synthesize name = _name;
@synthesize created_at = _created_at;

- (id) initWithDict:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.id = [dictionary valueForKey:@"id"];
        self.name = [dictionary valueForKey:@"name"];
        self.created_at = [dictionary valueForKey:@"created_at"];
    }
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"ID: %@\nName: %@\nCreated At: %@\n\n", self.id,self.name,self.created_at];
}

+ (NSArray *) getPlans
{
    NSArray *json = [WorkkoutRequest getRequest:@"/plans.json"];
    
    NSMutableArray *plans = [[NSMutableArray alloc] init];
    
    for (NSDictionary *d in json) {
        [plans addObject:[[WorkkoutPlan alloc] initWithDict:d]];
    }
    
    return plans;
    
}


@end
