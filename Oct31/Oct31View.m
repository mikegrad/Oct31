//
//  Oct31View.m
//  Oct31
//
//  Created by Michael Gradilone on 10/31/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "Oct31View.h"
#import <AVFoundation/AVFoundation.h>

@implementation Oct31View

- (id)initWithFrame:(CGRect)frame
{
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
    [bundle pathForResource: @"video" ofType: @"png"];
    if (pathPause == nil) {
        NSLog(@"could not get the path");
    }

    UIFont *font = [UIFont systemFontOfSize: 10.0];
    
    UIImage *play = [[UIImage alloc] initWithContentsOfFile:pathPlay];
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        buttonPumpkin = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
		//Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(100, 40);	//size of button
        
        NSLog(@"bounds is %f by %f", b.size.width, b.size.height);
        
		buttonPumpkin.frame = CGRectMake(
                                  b.origin.x + (b.size.width / 6) - (s.width/2),
                                  b.size.height - 40 - (s.height/2),
                                  s.width,
                                  s.height
                                  );
        
		buttonPumpkin.backgroundColor = [UIColor orangeColor];
		[buttonPumpkin setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [buttonPumpkin setFont:font];
		[buttonPumpkin setTitle: @"Press Here" forState: UIControlStateNormal];
        [buttonPumpkin setImage:play forState:UIControlStateNormal];
        
		[buttonPumpkin addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: buttonPumpkin];

        buttonXmas = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        buttonXmas.frame = CGRectMake(
                                  b.origin.x + (b.size.width / 2) - (s.width/2),
                                  b.size.height - 40 - (s.height/2),
                                  s.width,
                                  s.height
                                  );
        
		buttonXmas.backgroundColor = [UIColor greenColor];
        [buttonXmas setFont:font];
		[buttonXmas setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[buttonXmas setTitle: @"Press Here" forState: UIControlStateNormal];
        
        
		[buttonXmas addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInsideXmas:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: buttonXmas];
    
        buttonTurkey = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        buttonTurkey.frame = CGRectMake(
                                         b.origin.x + (b.size.width / 6 * 5) - (s.width/2),
                                         b.size.height - 40 - (s.height/2),
                                         s.width,
                                         s.height
                                         );
        
		buttonTurkey.backgroundColor = [UIColor brownColor];
        [buttonTurkey setFont:font];
		[buttonTurkey setTitleColor: [UIColor orangeColor] forState: UIControlStateNormal];
		[buttonTurkey setTitle: @"Press Here" forState: UIControlStateNormal];
        
		[buttonTurkey addTarget: [UIApplication sharedApplication].delegate
                          action: @selector(touchUpInsideTurkey:)
                forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: buttonTurkey];
  
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
