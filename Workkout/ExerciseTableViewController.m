//
//  ExerciseTableViewController.m
//  Workkout
//
//  Created by Danyal Prout on 13/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import "ExerciseTableViewController.h"
#import "WorkkoutExercise.h"

@interface ExerciseTableViewController ()

@end

@implementation ExerciseTableViewController

@synthesize exercises = _exercises;
@synthesize filteredExercises = _filteredExercises;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.exercises = [WorkkoutExercise getExercises];
    self.filteredExercises = [NSMutableArray arrayWithCapacity:[self.exercises count]];

}

- (void)viewDidUnload
{
  //  self.filteredExercises = nil;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSLog(@"PE1 %d", [self.filteredExercises count]);
        return [self.filteredExercises count];
    } else {
        return [self.exercises count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Exercise Name";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSLog(@"%@", cell.reuseIdentifier);
    
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	/*
	 If the requesting table view is the search display controller's table view, configure the cell using the filtered content, otherwise use the main list.
	 */
	WorkkoutExercise *exercise = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSLog(@"P.E");
        exercise = [self.filteredExercises objectAtIndex:indexPath.row];
    } else {
        exercise = [self.exercises objectAtIndex:indexPath.row];
    }
	
	cell.textLabel.text = exercise.name;
	return cell;
}

#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    /*
     Update the filtered array based on the search text and scope.
     */
    
    [self.filteredExercises removeAllObjects]; // First clear the filtered array.
    
    /*
     Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
     */
    for (WorkkoutExercise *exercise in self.exercises)
    {
            NSComparisonResult result = [exercise.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
            {
                [self.filteredExercises addObject:exercise];
            }
    }
}


#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}









@end
