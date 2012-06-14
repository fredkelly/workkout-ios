//
//  WeightRepetionsPickerControl.h
//  Workkout
//
//  Created by Danyal Prout on 14/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeightRepetionsPickerControl : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *weights;
@property (nonatomic, strong) NSArray *repetitions;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *display;

@end
