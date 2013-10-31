//
//  Oct31AppDelegate.m
//  Oct31
//
//  Created by Michael Gradilone on 10/31/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "Oct31AppDelegate.h"
#import "Oct31View.h"

@implementation Oct31AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
    oct31View = [[Oct31View alloc] initWithFrame: screen.applicationFrame];
    self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
    //self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window addSubview: oct31View];
    [self.window makeKeyAndVisible];
    
    //need to make my own views here - swinging door to the music?
    
    
    //Player stuff
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
    }
    
    //The path is the filename.
    NSString *path =
    [bundle pathForResource: @"peanuts" ofType: @"m4a"];
    if (path == nil) {
        NSLog(@"could not get the path");
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    mp3PlayerXmas = [[AVAudioPlayer alloc]
                 initWithContentsOfURL: url error: &error];
    if (mp3PlayerXmas == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    
    mp3PlayerXmas.volume = 1.0;		//the default
    mp3PlayerXmas.numberOfLoops = 0;	//negative number for infinite loop
    /*
     NSLog(@"player.numberOfChannels == %u",
     player.numberOfChannels); //mono or stereo
     */
    
    if (![mp3PlayerXmas prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
    
    
    // great pumpkin
    //The path is the filename.
    NSString *pathPumpkin =
    [bundle pathForResource: @"pumpkin" ofType: @"m4a"];
    if (pathPumpkin == nil) {
        NSLog(@"could not get the pumpkin path");
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *urlPumpkin = [NSURL fileURLWithPath: pathPumpkin isDirectory: NO];
    NSLog(@"url == \"%@\"", urlPumpkin);
    
    //NSError *error = nil;
    mp3PlayerPumpkin = [[AVAudioPlayer alloc]
                 initWithContentsOfURL: urlPumpkin error: &error];
    if (mp3PlayerPumpkin == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    
    mp3PlayerPumpkin.volume = 1.0;		//the default
    mp3PlayerPumpkin.numberOfLoops = 0;	//negative number for infinite loop
    /*
     NSLog(@"player.numberOfChannels == %u",
     player.numberOfChannels); //mono or stereo
     */
    
    if (![mp3PlayerPumpkin prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
    
    
    // Turkey
    //The path is the filename.
    NSString *pathTurkey =
    [bundle pathForResource: @"turkey" ofType: @"m4a"];
    if (pathTurkey == nil) {
        NSLog(@"could not get the turkey path");
    }
    NSLog(@"path == \"%@\"", pathTurkey);
    
    NSURL *urlTurkey = [NSURL fileURLWithPath: pathTurkey isDirectory: NO];
    NSLog(@"url == \"%@\"", urlTurkey);
    
    //NSError *error = nil;
    mp3PlayerTurkey = [[AVAudioPlayer alloc]
                        initWithContentsOfURL: urlTurkey error: &error];
    if (mp3PlayerTurkey == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    
    mp3PlayerTurkey.volume = 1.0;		//the default
    mp3PlayerTurkey.numberOfLoops = 0;	//negative number for infinite loop
    /*
     NSLog(@"player.numberOfChannels == %u",
     player.numberOfChannels); //mono or stereo
     */
    
    if (![mp3PlayerTurkey prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
    /*
     if (![mp3Player play]) {
        NSLog(@"could not play");
        return YES;
    }
     */
    
    return YES;
}
- (void) touchUpInside: (UIButton*) sender {
    
	NSLog(@"The \"%@\" button was pressed.",
          [sender titleForState: UIControlStateNormal]);
    
    //Player stuff
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
    }
    
    
    //The path is the filename.
    NSString *pathPlay =
    [bundle pathForResource: @"video" ofType: @"png"];
    if (pathPlay == nil) {
        NSLog(@"could not get the path");
    }
    
    //The path is the filename.
    NSString *pathPause =
    [bundle pathForResource: @"pause" ofType: @"png"];
    if (pathPause == nil) {
        NSLog(@"could not get the path");
    }
    
    UIImage *pause = [[UIImage alloc]initWithContentsOfFile:pathPause];
    UIImage *play = [[UIImage alloc]initWithContentsOfFile:pathPlay];
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    if (mp3PlayerPumpkin.playing) {
        [mp3PlayerPumpkin stop];
        
        [sender setImage:play forState:UIControlStateNormal];
        [sender setTitle:@"Stopped Playing" forState:UIControlStateNormal];
    } else {
        [mp3PlayerPumpkin play];
        
        [sender setImage:pause forState:UIControlStateNormal];
        [sender setTitle:@"Now Playing" forState:UIControlStateNormal];
    }
	
}

- (void) touchUpInsideTurkey: (UIButton*) sender {
    
	NSLog(@"The \"%@\" button was pressed.",
          [sender titleForState: UIControlStateNormal]);
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    if (mp3PlayerTurkey.playing) {
        [mp3PlayerTurkey stop];
        [sender setTitle:@"Stopped Playing" forState:UIControlStateNormal];
    } else {
        
        [mp3PlayerTurkey play];
        
        [sender setTitle:@"Now Playing" forState:UIControlStateNormal];
    }
	
}

- (void) touchUpInsideXmas: (UIButton*) sender {
    
	NSLog(@"The \"%@\" button was pressed.",
          [sender titleForState: UIControlStateNormal]);
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    if (mp3PlayerXmas.playing) {
        [mp3PlayerXmas stop];
        [sender setTitle:@"Stopped Playing" forState:UIControlStateNormal];
    } else {
        [mp3PlayerXmas play];
        [sender setTitle:@"Now Playing" forState:UIControlStateNormal];
    }
	
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
