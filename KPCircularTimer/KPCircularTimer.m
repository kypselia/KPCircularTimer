//
//  CircularTimer.m
//
//  Copyright (c) 2013 Crowd Studio, (c) 2014 Kypselia. All rights reserved.
//

#import "KPCircularTimer.h"

@interface KPCircularTimer ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation KPCircularTimer {
    BOOL _running;
    NSTimeInterval _elapsedTime;
    CGFloat _partCompleted;
}

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)
#define timeIntervalBetweenRefresh 0.1

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setup];
    }
    return self;
}

- (id)initWithTimeInterval:(NSTimeInterval)timeToRun position:(CGPoint)position radius:(CGFloat)radius strokeWidth:(CGFloat)strokeWidth backgroundStrokeColor:(UIColor *)backgroundStrokeColor foregroundStrokeColor:(UIColor *)foregroundStrokeColor startCallback:(void (^)(void))startBlock endCallback:(void (^)(void))endBlock {
    self = [super initWithFrame:CGRectMake(position.x, position.y, radius * 2, radius * 2)];
    if (self) {
        self.timeToRun = timeToRun;
        self.strokeWidth = strokeWidth;
        self.backgroundStrokeColor = backgroundStrokeColor;
        self.foregroundStrokeColor = foregroundStrokeColor;
        self.startBlock = startBlock;
        self.endBlock = endBlock;
        [self setup];
    }
    return self;
}

- (CGFloat)radius {
    return MIN(self.frame.size.width, self.frame.size.height)/2.0f;
}

- (void)setup {    
    if (self.timeToRun < 0) {
        NSLog(@"Timer has negative value.");
    } else {    
        _elapsedTime = 0.0f;
        _partCompleted = 0.0f;
        _running = NO;
    }
}

- (void)drawRect:(CGRect)rect {
    //General circle info
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    float strokeWidth = (self.strokeWidth > 0) ? self.strokeWidth : 10.0f;
    if(strokeWidth > self.radius) strokeWidth = self.radius; 
    float radius = self.radius - strokeWidth / 2;
    
#if TARGET_INTERFACE_BUILDER
    _partCompleted = 0.2;
#endif
    
    //Background circle
    UIBezierPath *circle1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0.0f endAngle:2 * M_PI clockwise:YES];
    [self.backgroundStrokeColor setStroke];
    circle1.lineWidth = strokeWidth;
    [circle1 stroke];
    
    //Active circle
    float startAngle = DEGREES_TO_RADIANS(self.startAngle) - M_PI_2;
    float endAngle = _partCompleted * 2 * M_PI + startAngle;
    if(endAngle < startAngle) endAngle += 2 * M_PI;
    
    UIBezierPath *circle2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [self.foregroundStrokeColor setStroke];
    circle2.lineWidth = strokeWidth;
    [circle2 stroke];
}

- (void)updateCircle:(NSTimer *)theTimer {
    _elapsedTime += timeIntervalBetweenRefresh;
    _partCompleted = self.elapsedTime / self.timeToRun;

    if (self.elapsedTime > self.timeToRun) {
        [self completeRun];
    }
    [self setNeedsDisplay];
}

- (void)start {
    if (_running == NO) {
        _running = YES;
        if (self.startBlock != nil) {
            self.startBlock();
        }
        if (self.elapsedTime < self.timeToRun) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:timeIntervalBetweenRefresh target:self selector:@selector(updateCircle:) userInfo:nil repeats:YES];
        }
    }
    [self setNeedsDisplay];
}

- (void)completeRun {
    _running = NO;
    [self.timer invalidate];
    _partCompleted = 1.0f;
    [self setNeedsDisplay];
    if (self.endBlock != nil) {
        self.endBlock();
    }
}


#pragma mark - Public

- (BOOL)isRunning {
    return _running;
}

- (void)pause {
    if (self.elapsedTime < self.timeToRun) {
        [self.timer invalidate];
    } else {
        [self stop];
    }
}

- (void)resume {
    if (self.elapsedTime < self.timeToRun) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeIntervalBetweenRefresh target:self selector:@selector(updateCircle:) userInfo:nil repeats:YES];
    } else {
        [self start];
    }
}

- (void)stop {
    [self completeRun];
}

@end
