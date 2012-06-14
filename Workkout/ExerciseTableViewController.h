//
//  ExerciseTableViewController.h
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@interface ExerciseTableViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *exercises;
@property (nonatomic, strong) NSMutableArray *filteredExercises;

@end
