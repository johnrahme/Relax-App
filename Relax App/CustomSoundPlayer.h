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
    NSTimer *timer;
}
@property (strong, nonatomic) NSString *soundUrl;
@property (strong, nonatomic) NSString *soundType;
@property (strong, nonatomic) NSString *labelText;
@property (nonatomic) BOOL sound;
@property (strong) AVAudioPlayer *audioPlayer;




@property (strong, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)play:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *sliderO;
- (IBAction)sliderA:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *timeL;
@property (strong, nonatomic) IBOutlet UILabel *timeR;
- (IBAction)restartA:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *label;
- (IBAction)back:(id)sender;

@end
