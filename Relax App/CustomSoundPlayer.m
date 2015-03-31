//
//  CustomSoundPlayer.m
//  Relax App
//
//  Created by admin on 24/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import "CustomSoundPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface CustomSoundPlayer ()

@end

@implementation CustomSoundPlayer
int sliderValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAudio];
    [self setupLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupLayout{
    _label.text = _labelText;
}

- (IBAction)play:(id)sender {
    if(clicked == 0){
        clicked = 1;
        [audioPlayer play];
        [_playButton setTitle:@"stop" forState:UIControlStateNormal];
        
    }
    else{
        clicked = 0;
        [audioPlayer pause];
        [_playButton setTitle:@"Start" forState:UIControlStateNormal];
    }
}

- (void)setupAudio{
    [self customSlider];
    NSString *videoFile = [[NSBundle mainBundle] pathForResource: _soundUrl ofType:_soundType];
    NSURL *url = [NSURL fileURLWithPath:videoFile];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = 0;
    //Setup the slider
    _sliderO.maximumValue = audioPlayer.duration;
    _sliderO.value = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
}
- (IBAction)sliderA:(id)sender {
    bool wasPlaying = audioPlayer.playing;
    [audioPlayer pause];
    audioPlayer.currentTime = _sliderO.value;
    if (wasPlaying) {
        [audioPlayer play];
    }
    
}
- (void)updateSlider{
    _sliderO.value = audioPlayer.currentTime;
    if (!audioPlayer.playing) {
        [_playButton setTitle:@"Start" forState:UIControlStateNormal];
        clicked = 0;
    }
    [self updateText];
    
}

- (void) updateText{
    //_timeL.text = [NSString stringWithFormat:@"%.f", audioPlayer.currentTime];
    //_timeR.text = [NSString stringWithFormat:@"%.f", audioPlayer.duration];
    
    //A somewhat bad way of doing this, might be done better
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    NSDate *currDate = [NSDate dateWithTimeIntervalSince1970:audioPlayer.currentTime];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:audioPlayer.duration];
    _timeL.text = [dateFormatter stringFromDate:currDate];
    _timeR.text = [dateFormatter stringFromDate:endDate];
    
}
- (IBAction)restartA:(id)sender {
    [audioPlayer pause];
    audioPlayer.currentTime = 0;
    if (clicked) {
        [audioPlayer play];
    }
    
}
- (void)customSlider{
    UIImage *thumbImage = [UIImage imageNamed:@"steelButton.png"];
    [_sliderO setThumbImage:thumbImage forState:UIControlStateNormal];
    
    UIImage *minImage = [[UIImage imageNamed:@"slider_minimum.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [_sliderO setMinimumTrackImage:minImage forState:UIControlStateNormal];
    
    UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [_sliderO setMaximumTrackImage:maxImage forState:UIControlStateNormal];
}
- (IBAction)back:(id)sender {
    ViewController *home = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [audioPlayer stop];
    [self presentViewController: home animated: YES completion:nil];
}
@end
