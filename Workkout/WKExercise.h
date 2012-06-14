//
//  WKExercise.h
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKRequest.h"

@interface WKExercise : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;

- (id) initWithDict:(NSDictionary *)dictionary;
- (NSString *) description;

+ (NSArray *) getExercises;

@end
