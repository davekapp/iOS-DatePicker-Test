//
//  DateTestViewController.h
//  DateTest
//
//  Created by David Kapp on 2/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DateChooserViewController.h"

@interface DateTestViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisible;

- (IBAction)showDateChooserModal:(id)sender;
- (IBAction)showDateChooserPopover:(id)sender;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (NSTimeInterval)intervalBetweenTodayAndDate:(NSDate *)aDate;
- (void)calculateDateDifferenceUsingDate:(NSDate *)aDate;
@end
