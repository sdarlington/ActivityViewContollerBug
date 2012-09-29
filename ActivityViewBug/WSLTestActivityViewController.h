//
//  WSLTestActivityViewController.h
//  ActivityViewBug
//
//  Created by Stephen Darlington on 29/09/2012.
//  Copyright (c) 2012 Stephen Darlington. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSLTestActivityViewController : UIViewController

@property(weak,nonatomic) UIActivity* activity;

- (IBAction)doneButton:(id)sender;

@end
