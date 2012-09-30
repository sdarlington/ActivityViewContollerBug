ActivityViewContollerBug
========================

I have a problem: http://stackoverflow.com/q/12543565/2998

Current observations:

* This works as I'd expect on the iPhone
* On the iPad the "I'm done" button doesn't work
* On the iPad the activityViewController appears modally rather than as a popup. Is this Apple's bug or am I missing something?

In detail:


I have a `UIActivity` subclass that creates its own activityViewController:

    - (UIViewController *)activityViewController {
        WSLInProgressViewController* progressView = [[[WSLInProgressViewController alloc] init] autorelease];
        progressView.message = [NSString stringWithFormat:NSLocalizedString(@"Posting to %@...",@"Posting to..."),
                            self.activityType];
    
        return progressView;
    }

According to the documentation, you are not supposed to dismiss this manually. Instead, the OS does that when you call `activityDidFinish:`. This works just fine when run on an iPhone.

When I say "works," this is the sequence of events that I'm expecting (and see on the iPhone):

1. Display the `UIActivityViewController`
2. User presses my custom activity
3. My view controller appears
4. I call `activityDidFinish:`
5. My custom view controller is dismissed
6. The `UIActivityViewController` is also dismissed

However, when I run this exact same code on the iPad Simulator -- the only difference being that I put the `UIActivityViewController` in a popup, as the documentation says you should -- the `activityViewController` is never dismissed.

As I say, this is _exactly the same code_ that works on the iPhone and I have stepped through the code so I know that `activityDidFinish:` is getting called.

I found this Radar talking about the [same problem in iOS 6 beta 3][1], but it seems such fundamental functionality that I suspect a bug in my code rather than OS (also note that it works correctly with the Twitter and Facebook functionality!).

Am I missing something? Do I need to do something special in the activityViewController when it's run in a `UIPopoverViewController`? Is the "flow" _supposed_ to be different on the iPad?


  [1]: http://openradar.appspot.com/12034500

