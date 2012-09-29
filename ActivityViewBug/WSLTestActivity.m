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
