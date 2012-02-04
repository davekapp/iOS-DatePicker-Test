//
//  DateTestViewController.m
//  DateTest
//
//  Created by David Kapp on 2/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DateTestViewController.h"

@implementation DateTestViewController
@synthesize outputLabel;
@synthesize dateChooserVisible = _dateChooserVisible;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)showDateChooserModal:(id)sender {
  if (self.dateChooserVisible != YES) {
    self.dateChooserVisible = YES;
    [self performSegueWithIdentifier:@"dateChooserModal" sender:self];
  }  
}

- (IBAction)showDateChooserPopover:(id)sender {
  if (self.dateChooserVisible != YES) {
    self.dateChooserVisible = YES;
    [self performSegueWithIdentifier:@"dateChooserPopover" sender:self];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  ((DateChooserViewController*)segue.destinationViewController).delegate = self;
}

- (NSTimeInterval)intervalBetweenTodayAndDate:(NSDate *)aDate {
  NSDate *now = [NSDate date];
  NSTimeInterval interval = [now timeIntervalSinceDate:aDate];
  return interval;
}

- (void)calculateDateDifferenceUsingDate:(NSDate *)aDate {
  NSTimeInterval interval = [self intervalBetweenTodayAndDate:aDate];
  NSTimeInterval intervalInDays = interval / 86400; // seconds in a day
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"MMMM d, yyyy hh:mm:ssa"];
  
  NSString *outputText = [[NSString alloc] 
                          initWithFormat:@"Difference between chosen date %@ and today %@ in days: %1.2f",
                          [dateFormat stringFromDate:[NSDate date]],
                          [dateFormat stringFromDate:aDate],
                          fabs(intervalInDays)];
  
  self.outputLabel.text = outputText;
}

@end
