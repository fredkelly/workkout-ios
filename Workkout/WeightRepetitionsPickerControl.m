//
//  WeightRepetionsPickerControl.m
//  Workkout
//
//  Created by Danyal Prout on 14/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import "WeightRepetitionsPickerControl.h"

@implementation WeightRepetionsPickerControl

#define WEIGHT 0
#define REPETITIONS 1

@synthesize weights = _weights;
@synthesize repetitions = _repitions;
@synthesize pickerView = _pickerView;
@synthesize display = _display;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.weights = [[NSArray alloc] initWithObjects:@"10", @"15", @"20", @"25", @"30",@"35", @"40", nil];
    self.repetitions = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", nil];
    self.display.text = @"HELLO";
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    if (component == WEIGHT) {
        return [self.weights count];
    } else if (component == REPETITIONS) {
        return [self.repetitions count];
    }
    
    return 0;
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    NSString *title;
    
    if (component == WEIGHT) {
        
        title = [self.weights objectAtIndex:row];
        
    } else if (component == REPETITIONS) {
        
        title = [self.repetitions objectAtIndex:row];
        
    }
    
    return title;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    if (component == WEIGHT) {
        NSLog(@"WEIGHT - %@", [self.weights objectAtIndex:row]);
    } else if (component == REPETITIONS) {
        NSLog(@"REP - %@", [self.repetitions objectAtIndex:row]);
    }
}

- (void)viewDidUnload {
    [self setPickerView:nil];
    [self setDisplay:nil];
    [super viewDidUnload];
}

@end
