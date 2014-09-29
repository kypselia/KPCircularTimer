//
//  MasterViewController.m
//  KPCircularTimerDemo
//
//  Created by Karim-Pierre Maalej on 29/09/2014.
//  Copyright (c) 2014 Kypselia. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, assign) NSTimeInterval countdownDuration;
@property (nonatomic, strong) UIView *hidePickerView;
@property (weak, nonatomic) IBOutlet UIButton *launchButton;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.launchButton.enabled = NO;
    self.countdownDuration = 0.0f;
    
    self.foregroundCircleStrokeColorSegmentedControl.selectedSegmentIndex = 2;
    self.backgroundCircleStrokeColorSegmentedControl.selectedSegmentIndex = 3;
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height + 250, 325, 250)];
    self.datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    self.datePicker.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.datePicker];
}

- (IBAction)showPicker:(UIButton *)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:0.3 animations:^{
        self.datePicker.frame = CGRectMake(0, screenRect.size.height - 230, 320, 250);
    }];
    [self addCancelView];
}

- (void)addCancelView {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.hidePickerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0, 320, screenRect.size.height - 230)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePicker:)];
    [self.hidePickerView addGestureRecognizer:tap];
    self.hidePickerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.hidePickerView];
}

- (void)hidePicker:(UITapGestureRecognizer *)sender {
    [self.hidePickerView removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        self.datePicker.frame = CGRectMake(0, self.view.frame.size.height + 250, 325, 250);
    }];
    [self changeDate:self.datePicker];
}

- (void)changeDate:(UIDatePicker *)sender {
    self.countdownDuration = sender.countDownDuration;
    [self.initialDateButton setTitle:[NSString stringWithFormat:@"%d seconds", (int)self.countdownDuration] forState:UIControlStateNormal];
    self.launchButton.enabled = YES;
    [self.view layoutIfNeeded];
}

- (IBAction)slideRadius:(UISlider *)sender {
    NSString* formattedValue = [NSString stringWithFormat:@"%.f", sender.value];
    self.radiusLabel.text = [NSString stringWithFormat:@"Stroke width (%@)", formattedValue];
}

- (UIColor *)getColorForSelectedSegmentedControl:(UISegmentedControl *)sg {
    switch (sg.selectedSegmentIndex) {
        case 0:
            return [UIColor lightGrayColor];
            break;
        case 1:
            return [UIColor whiteColor];
            break;
        case 2:
            return [UIColor blackColor];
            break;
        case 3:
            return [UIColor redColor];
            break;
        default:
            break;
    }
    return [UIColor whiteColor];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.circleStrokeWidth = round(self.strokeWidthSlider.value);
        detailViewController.countDownDuration = self.countdownDuration;
        detailViewController.foregroundCircleStrokeColor = [self getColorForSelectedSegmentedControl:self.foregroundCircleStrokeColorSegmentedControl];
        detailViewController.backgroundCircleStrokeColor = [self getColorForSelectedSegmentedControl:self.backgroundCircleStrokeColorSegmentedControl];        
    }
}

@end
