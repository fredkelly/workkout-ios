//
//  WorkkoutAppDelegate.h
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"


@interface WorkkoutAppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Facebook *facebook;

@end
