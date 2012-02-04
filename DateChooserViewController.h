//
//  DateChooserViewController.h
//  DateTest
//
//  Created by David Kapp on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DateTestViewController.h"

@interface DateChooserViewController : UIViewController
@property (weak, nonatomic) id delegate;

- (IBAction)setDateTime:(id)sender;

- (IBAction)dismissModalDateChooser:(id)sender;
@end
