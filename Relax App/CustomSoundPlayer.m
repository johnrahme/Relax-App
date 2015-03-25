//
//  CustomSoundPlayer.m
//  Relax App
//
//  Created by admin on 24/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import "CustomSoundPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface CustomSoundPlayer ()

@end

@implementation CustomSoundPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAudio];

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
    NSString *videoFile = [[NSBundle mainBundle] pathForResource: @"classic" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:videoFile];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = 0;
}
@end
