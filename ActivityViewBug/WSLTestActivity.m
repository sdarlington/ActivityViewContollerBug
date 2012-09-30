//
//  WSLTestActivity.m
//  ActivityViewBug
//
//  Created by Stephen Darlington on 29/09/2012.
//  Copyright (c) 2012 Stephen Darlington. All rights reserved.
//

#import "WSLTestActivity.h"
#import "WSLTestActivityViewController.h"

@implementation WSLTestActivity

- (NSString *)activityType {
    return @"Test";
}

- (NSString *)activityTitle {
    return @"Test";
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}

// According to the documentation
// (https://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIActivity_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40011974):
//
// The default implementation of this method returns nil. Subclasses that provide additional
// UI using a view controller can override this method to return that view controller. If
// this method returns a valid object, the system presents the returned view controller for
// you, instead of calling the performActivity method. On iPad, your view controller is
// presented inside of a popover. On iPhone and iPod touch, your view controller is presented modally.
//
// Your custom view controller should provide a view with your custom UI and should
// handle any user interactions inside those views. Upon completing the activity, do
// not dismiss the view controller yourself. Instead, call the activityDidFinish: method
// and let the system dismiss it for you.
//
// So:
// 1. Don't "manually" dismiss the view controller; cll activityDidFinish:
// 2. It's presented in a pop-over on an iPad

- (UIViewController *)activityViewController {
    UIStoryboard* story;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        story = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil ];
    }
    else {
        story = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil ];
    }
    WSLTestActivityViewController* vc = [story instantiateViewControllerWithIdentifier:@"ActivityViewController"];
    vc.activity = self;
    return vc;
}

@end
