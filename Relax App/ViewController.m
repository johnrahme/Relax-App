//
//  ViewController.m
//  Relax App
//
//  Created by admin on 18/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import "ViewController.h"
#import "MediaPlayer/MediaPlayer.h"
#import "CustomSoundPlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Ex1:(id)sender {
    [self gotoSoundPlayer:@"ProgLiggande" :@"m4a" :@"Progressiv avspänning liggandes"];
}

- (IBAction)Ex2:(id)sender {
    [self gotoSoundPlayer:@"ProgSittande" :@"m4a" :@"Progressiv avspänning sittandes"];
}
- (void)gotoSoundPlayer:(NSString*)soundUrl :(NSString*)soundType :(NSString*)labelText{
    CustomSoundPlayer *soundPlayer = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomSoundPlayer"];
    soundPlayer.soundUrl = soundUrl;
    soundPlayer.soundType = soundType;
    soundPlayer.labelText = labelText;
    soundPlayer.sound = false;
    
    [self presentViewController: soundPlayer animated: YES completion:nil];
}
@end
