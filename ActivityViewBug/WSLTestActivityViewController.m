//
//  WSLTestActivityViewController.m
//  ActivityViewBug
//
//  Created by Stephen Darlington on 29/09/2012.
//  Copyright (c) 2012 Stephen Darlington. All rights reserved.
//

#import "WSLTestActivityViewController.h"

@interface WSLTestActivityViewController ()

@end

@implementation WSLTestActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    // Don't "manually" dismiss, instead call activityDidFinish: of the UIActivity.
    [self.activity activityDidFinish:YES];
}

@end
