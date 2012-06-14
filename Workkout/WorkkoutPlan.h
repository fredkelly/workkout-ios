//
//  WorkkoutPlan.h
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkkoutRequest.h"

@interface WorkkoutPlan : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *created_at;

- (NSString *) description;
- (id) initWithDict:(NSDictionary *)dictionary;

+ (NSArray *) getPlans;

@end
