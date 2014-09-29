//
//  DetailViewController.h
//  KPCircularTimerDemo
//
//  Created by Karim-Pierre Maalej on 29/09/2014.
//  Copyright (c) 2014 Kypselia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, assign) CGFloat circleStrokeWidth;
@property (nonatomic, strong) UIColor *backgroundCircleStrokeColor;
@property (nonatomic, strong) UIColor *foregroundCircleStrokeColor;
@property (nonatomic, assign) NSTimeInterval countDownDuration;

@property (nonatomic, weak) IBOutlet UILabel *statusLabel;

@end

