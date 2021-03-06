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
@synthesize audioPlayer;
int sliderValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAudio];
    [self setupLayout];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(didEnterBackground) name:UIApplicationWillResignActiveNotification object:nil];
    

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
        [self playAudio];
    }
    else{
        [self pauseAudio];
    }
}
-(void)playAudio{
    clicked = 1;
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    NSLog(@"Playing");
    [_playButton setTitle:@"stop" forState:UIControlStateNormal];
}
-(void)pauseAudio{
    clicked = 0;
    NSLog(@"stopping");
    [audioPlayer stop];
    [_playButton setTitle:@"Start" forState:UIControlStateNormal];
}

- (void)setupAudio{
    [self customSlider];
    
    NSString *videoFile = [[NSBundle mainBundle] pathForResource: _soundUrl ofType:_soundType];
    NSURL *url = [NSURL fileURLWithPath:videoFile];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = 0;
    audioPlayer.delegate = self;
    [audioPlayer stop];
    //Setup the slider
    _sliderO.maximumValue = audioPlayer.duration;
    _sliderO.value = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
}
- (IBAction)sliderA:(id)sender {
    bool wasPlaying = audioPlayer.playing;
    [audioPlayer stop];
    audioPlayer.currentTime = _sliderO.value;
    if (wasPlaying) {
        [audioPlayer prepareToPlay];
        [audioPlayer play];
    }
    //Can be made in a better way, on release and on drag actions for slider
    if(_sliderO.value == _sliderO.maximumValue&&wasPlaying){
        [self pauseAudio];
    }
    
}
- (void)updateSlider{
    _sliderO.value = audioPlayer.currentTime;
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
    [audioPlayer stop];
    audioPlayer.currentTime = 0;
    if (clicked) {
        [audioPlayer prepareToPlay];
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
    [self resetStuff];
    ViewController *home = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController: home animated: YES completion:nil];

    
}
- (void)resetStuff{
    [audioPlayer stop];
    audioPlayer =nil;
    [timer invalidate];
    timer = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    
}
-(void)didEnterBackground{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"kDisplayStatusLocked"]) {
        clicked = 0;
        NSLog(@"StoppedByDidEnterBackground");
        [audioPlayer stop];
        [_playButton setTitle:@"Start" forState:UIControlStateNormal];
    }

    
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [_playButton setTitle:@"Start" forState:UIControlStateNormal];
    clicked = 0;
}
@end
