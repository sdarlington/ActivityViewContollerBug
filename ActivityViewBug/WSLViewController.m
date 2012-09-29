//
//  WSLViewController.m
//  ActivityViewBug
//
//  Created by Stephen Darlington on 29/09/2012.
//  Copyright (c) 2012 Stephen Darlington. All rights reserved.
//

#import "WSLViewController.h"
#import "WSLTestActivity.h"

@interface WSLViewController ()

@property(strong,nonatomic) UIPopoverController* popup;

@end

@implementation WSLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressGo:(UIButton*)sender {
    NSURL* url = [NSURL URLWithString:@"http://www.wandlesoftware.com"];
    WSLTestActivity* test = [[WSLTestActivity alloc] init];
    UIActivityViewController* activity = [[UIActivityViewController alloc] initWithActivityItems:@[ url ]
                                                                           applicationActivities:@[ test ]];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
//        [self presentModalViewController:activity animated:YES];
        [self presentViewController:activity animated:YES completion:nil];
    }
    else {
        self.popup = [[UIPopoverController alloc] initWithContentViewController:activity];
        [self.popup presentPopoverFromRect:sender.frame
                                    inView:self.view
                  permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}
@end
