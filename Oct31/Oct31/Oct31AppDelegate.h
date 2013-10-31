//
//  Oct31AppDelegate.h
//  Oct31
//
//  Created by Michael Gradilone on 10/31/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Oct31View;


@interface Oct31AppDelegate : UIResponder <UIApplicationDelegate> {
    Oct31View *oct31View;
    UIWindow *_window;
    AVAudioPlayer *mp3PlayerXmas;
    
    AVAudioPlayer *mp3PlayerPumpkin;
    
    AVAudioPlayer *mp3PlayerTurkey;
}

@property (strong, nonatomic) UIWindow *window;

@end
