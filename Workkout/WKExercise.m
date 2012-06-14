//
//  WKExercise.m
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import "WKExercise.h"

@implementation WKExercise

@synthesize id = _id;
@synthesize name = _name;

- (id) initWithDict:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.id = [dictionary valueForKey:@"id"];
        self.name = [dictionary valueForKey:@"name"];
    }
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"ID: %@\nName: %@\n\n", self.id,self.name];
}

+ (NSArray *) getExercises
{
    NSArray *json = [WKRequest getRequest:@"/exercises.json"];
    
    NSMutableArray *exercises = [[NSMutableArray alloc] init];
    
    for (NSDictionary *d in json) {
        [exercises addObject:[[WKExercise alloc] initWithDict:d]];
    }
    
    return exercises;
}

@end
