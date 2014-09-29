//
//  MasterViewController.h
//  KPCircularTimerDemo
//
//  Created by Karim-Pierre Maalej on 29/09/2014.
//  Copyright (c) 2014 Kypselia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISegmentedControl *backgroundCircleStrokeColorSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *foregroundCircleStrokeColorSegmentedControl;
@property (nonatomic, weak) IBOutlet UISlider *strokeWidthSlider;
@property (nonatomic, weak) IBOutlet UIButton *initialDateButton;
@property (nonatomic, weak) IBOutlet UILabel *radiusLabel;

- (IBAction)showPicker:(id)sender;
- (IBAction)slideRadius:(id)sender;

@end

