//
//  ViewRelax.m
//  Relax App
//
//  Created by admin on 21/03/15.
//  Copyright (c) 2015 AppNovum. All rights reserved.
//

#import "ViewRelax.h"
#import "MediaPlayer/MediaPlayer.h"

@interface ViewRelax ()

@end

@implementation ViewRelax
@synthesize moviePlayer;
@synthesize videoView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    NSString *videoFile = [[NSBundle mainBundle] pathForResource: @"sound2" ofType:@"wav"];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoFile]];
    moviePlayer.view.frame = videoView.frame;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer prepareToPlay];
}
@end
