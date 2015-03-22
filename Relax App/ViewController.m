//
//  ViewController.m
//  Relax App
//
//  Created by admin on 18/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import "ViewController.h"
#import "MediaPlayer/MediaPlayer.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize moviePlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)playSong{
    
    
}

- (IBAction)play:(id)sender {
    NSString *videoFile = [[NSBundle mainBundle] pathForResource: @"sound2" ofType:@"wav"];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoFile]];
    moviePlayer.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 120);
    [self.view addSubview:moviePlayer.view];
    [moviePlayer prepareToPlay];
}
@end
