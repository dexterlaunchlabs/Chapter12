//
//  BIDMainViewController.m
//  AppSettings
//
//  Created by Dexter Launchlabs on 7/29/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDMainViewController.h"

@interface BIDMainViewController ()

@end

@implementation BIDMainViewController
@synthesize usernameLabel;
@synthesize passwordLabel;
@synthesize protocolLabel;
@synthesize warpDriveLabel;
@synthesize warpFactorLabel;
@synthesize favoriteTeaLabel;
@synthesize favoriteCandyLabel;
@synthesize favoriteGameLabel;
@synthesize favoriteExcuseLabel;
@synthesize favoriteSinLabel;
- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; usernameLabel.text = [defaults objectForKey:kUsernameKey]; passwordLabel.text = [defaults objectForKey:kPasswordKey]; protocolLabel.text = [defaults objectForKey:kProtocolKey]; warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey]
    ? @"Engaged" : @"Disabled"; warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey]
                                                        stringValue];
    favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    favoriteCandyLabel.text = [defaults objectForKey:kFavoriteCandyKey]; favoriteGameLabel.text = [defaults objectForKey:kFavoriteGameKey]; favoriteExcuseLabel.text = [defaults objectForKey:kFavoriteExcuseKey]; favoriteSinLabel.text = [defaults objectForKey:kFavoriteSinKey];
}
- (void)applicationWillEnterForeground:(NSNotification *)notification { NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; [defaults synchronize];
    [self refreshFields];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self refreshFields];
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
    self.usernameLabel = nil;
    self.passwordLabel = nil;
    self.protocolLabel = nil;
    self.warpDriveLabel = nil;
    self.warpFactorLabel = nil;
    self.favoriteTeaLabel = nil; self.favoriteCandyLabel = nil; self.favoriteGameLabel = nil; self.favoriteExcuseLabel = nil; self.favoriteSinLabel = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:app];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(BIDFlipsideViewController *)controller
{
    [self refreshFields];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
