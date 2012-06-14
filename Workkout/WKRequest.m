//
//  WKRequest.m
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import "WKRequest.h"

#define BASE_URL @"http://workkout.heroku.com"

@implementation WKRequest

+ (NSArray *) getRequest:(NSString *)path
{

    NSURL *url = [[NSURL alloc] initWithString:[BASE_URL stringByAppendingPathComponent: path]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSHTTPURLResponse *reponse = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&reponse error:&error];
    
    if (error != nil) {
        NSLog(@"Problem w/ getting data. %@", [error localizedDescription]);
        return nil;
    }
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (error != nil) {
        NSLog(@"Problem w/ parsing the data. %@", [error localizedDescription]);
        return nil;
    }
    
    return json; 
    
}


@end
