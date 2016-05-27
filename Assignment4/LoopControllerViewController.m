//
//  LoopControllerViewController.m
//  Assignment4
//
//  Created by Paul Harvey on 2016-03-30.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "LoopControllerViewController.h"

#define FRAME_UNTIL_FIRED 1
#define BALL_SPEED 10

@interface LoopControllerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImage;

@property float xMove;
@property float yMove;

@property CADisplayLink * timer;




@end

@implementation LoopControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_timer==nil)
    {
        _timer = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(loopingFunction)];
    
        [_timer setFrameInterval:FRAME_UNTIL_FIRED];
        
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loopingFunction {
    if (_xMove != 0 || _yMove !=0) {
        float newX = _ballImage.center.x + _xMove;
        float newY = _ballImage.center.y + _yMove;
        
        [_ballImage setCenter:CGPointMake(newX, newY)];
        
        int halfImage = _ballImage.frame.size.width/2;
        
        if ( newY > self.view.frame.size.height - halfImage)
        {
            newY = self.view.frame.size.height - halfImage;
        
        }
        
        if ( newY < halfImage) {
            newY = halfImage;
        }
        
        if ( newX > self.view.frame.size.width - halfImage)
        {
            newX = self.view.frame.size.width - halfImage;
            
        }
        
        if ( newX < halfImage) {
            newX = halfImage;
        }
        
        [_ballImage setCenter:CGPointMake(newX, newY)];
        
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backButton:(id)sender {
    [_timer invalidate];
    _timer = nil;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)upButtonPress:(id)sender {
    _yMove -= BALL_SPEED;
}

- (IBAction)upButtonRelease:(id)sender {
    _yMove = 0;
}

- (IBAction)downButtonPress:(id)sender {
     _yMove += BALL_SPEED;
}

- (IBAction)downButtonRelease:(id)sender {
    _yMove = 0;
}

- (IBAction)leftButtonPress:(id)sender {
    _xMove -= BALL_SPEED;
}

- (IBAction)leftButtonRelease:(id)sender {
    _xMove = 0;
}

- (IBAction)rightButtonPress:(id)sender {
    _xMove += BALL_SPEED;
}

- (IBAction)rightButtonRelease:(id)sender {
    _xMove = 0;
}





@end
