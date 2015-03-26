//
//  CustomSoundPlayer.h
//  Relax App
//
//  Created by admin on 24/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
int clicked;
@interface CustomSoundPlayer : UIViewController{
    AVAudioPlayer *audioPlayer;
}
@property (strong, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)play:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *sliderO;
- (IBAction)sliderA:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *timeL;
@property (strong, nonatomic) IBOutlet UILabel *timeR;
- (IBAction)restartA:(id)sender;

@end
