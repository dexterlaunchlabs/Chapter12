//
//  BIDFlipsideViewController.m
//  AppSettings
//
//  Created by Dexter Launchlabs on 7/29/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDFlipsideViewController.h"
#import "BIDMainViewController.h"

@interface BIDFlipsideViewController ()

@end

@implementation BIDFlipsideViewController
@synthesize engineSwitch;
@synthesize warpFactorSlider;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self refreshFields];
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:app];

}
- (void)applicationWillEnterForeground:(NSNotification *)notification { NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; [defaults synchronize];
    [self refreshFields];
}
- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; engineSwitch.on = [defaults boolForKey:kWarpDriveKey]; warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main vie
    // e.g. self.myOutlet = nil;
    self.engineSwitch = nil;
    self.warpFactorSlider = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (IBAction)engineSwitchTapped {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; [defaults setBool:engineSwitch.on forKey:kWarpDriveKey];
    [defaults synchronize];
}
- (IBAction)warpSliderTouched {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; [defaults setFloat:warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];
}
#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
