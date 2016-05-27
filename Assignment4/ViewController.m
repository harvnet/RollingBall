//
//  ViewController.m
//  Assignment4
//
//  Created by Paul Harvey on 2016-03-26.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startButton:(id)sender {
    [self performSegueWithIdentifier:@"segue1" sender:self];
}

@end
