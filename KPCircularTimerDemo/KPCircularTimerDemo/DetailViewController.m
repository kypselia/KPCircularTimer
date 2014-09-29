//
//  DetailViewController.m
//  KPCircularTimerDemo
//
//  Created by Karim-Pierre Maalej on 29/09/2014.
//  Copyright (c) 2014 Kypselia. All rights reserved.
//

#import "DetailViewController.h"
#import "KPCircularTimer.h"

@interface DetailViewController ()
@property (nonatomic, strong) IBOutlet KPCircularTimer *circularTimer;
@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [self configureCircle];
}

- (void)configureCircle {
    self.circularTimer.startAngle = 0;
    self.circularTimer.backgroundStrokeColor = self.backgroundCircleStrokeColor;
    self.circularTimer.foregroundStrokeColor = self.foregroundCircleStrokeColor;
    self.circularTimer.strokeWidth = self.circleStrokeWidth;
    self.circularTimer.timeToRun = self.countDownDuration;
    
    __weak DetailViewController *weakSelf = self;
    self.circularTimer.startBlock = ^{
        weakSelf.statusLabel.text = @"Running...";
    };
    self.circularTimer.endBlock = ^{
        weakSelf.statusLabel.text = @"Done!";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Done!" message:@"Timer has ended" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    };
    
    [self.circularTimer start];    
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
