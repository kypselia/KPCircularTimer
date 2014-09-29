//
//  CircularTimer.h
//
//  Copyright (c) 2013 Crowd Studio, (c) 2014 Kypselia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KPDefaultBlock)(void);

IB_DESIGNABLE
@interface KPCircularTimer : UIView

- (id)initWithTimeInterval:(NSTimeInterval)timeToRun 
                  position:(CGPoint)position 
                    radius:(CGFloat)radius 
               strokeWidth:(CGFloat)strokeWidth 
     backgroundStrokeColor:(UIColor *)backgroundStrokeColor 
     foregroundStrokeColor:(UIColor *)foregroundStrokeColor 
             startCallback:(void (^)(void))startBlock 
               endCallback:(void (^)(void))endBlock;


@property IBInspectable CGFloat startAngle; 
@property IBInspectable CGFloat strokeWidth;
@property IBInspectable UIColor *backgroundStrokeColor;
@property IBInspectable UIColor *foregroundStrokeColor;

@property NSTimeInterval timeToRun;
@property(nonatomic, copy) KPDefaultBlock startBlock;
@property(nonatomic, copy) KPDefaultBlock endBlock;

- (void)start;
- (void)pause;
- (void)resume;
- (void)stop;

@property(nonatomic, readonly) BOOL isRunning;
@property(nonatomic, readonly) NSTimeInterval elapsedTime;

@end
