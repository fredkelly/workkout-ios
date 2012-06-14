//
//  TimerViewController.m
//  Workkout
//
//  Created by Danyal Prout on 14/06/2012.
//  Copyright (c) 2012 University of Manchester. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property BOOL timing;
@property NSTimer *timer;
@property int elapsedTime;
- (void) showTime:(NSTimer *)timer;
@end

@implementation TimerViewController

@synthesize timerDisplay = _timerDisplay;
@synthesize timing = _timing;
@synthesize timer = _timer;
@synthesize elapsedTime = _elapsedTime;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) showTime:(NSTimer *)timer
{
    self.elapsedTime++;
    
    int mins = self.elapsedTime / 600;
    int seconds = (self.elapsedTime - (mins * 600)) / 10;
    int ms = self.elapsedTime - (mins * 600) - (seconds * 10);
    
    
    self.timerDisplay.text = [NSString stringWithFormat:@"%02d:%02d.%01d", mins, seconds, ms];
    
}

- (IBAction)start
{
    if (!self.timing) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(showTime:) userInfo:nil repeats:YES];
        self.timing = YES;
    }
}

- (IBAction)stop
{
    [self.timer invalidate];
    self.timer = nil;
    self.timing = NO;
}

- (IBAction)resetTimer
{
    if (self.timing) [self stop];
    self.elapsedTime = 0;
    self.timerDisplay.text = @"00:00.0";
}

- (void)viewDidUnload
{
    [self setTimer:nil];
    [self setTimerDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
