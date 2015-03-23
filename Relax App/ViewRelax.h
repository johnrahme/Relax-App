//
//  ViewRelax.h
//  Relax App
//
//  Created by admin on 21/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewRelax : UIViewController
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) IBOutlet UIView *videoView;
- (IBAction)play:(id)sender;

@end
