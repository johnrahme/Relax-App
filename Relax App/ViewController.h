//
//  ViewController.h
//  Relax App
//
//  Created by admin on 18/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
- (IBAction)play:(id)sender;

@end

