//
//  ACircle.m
//  AiLab
//
//  Created by huangwf on 14-8-20.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import "ACircle.h"

#define TIMER_INTERVAL 0.01
#define SECONDS_ADJUSTMENT 1000


@interface ACircle()
{
    UIColor *circleColor;
    UIColor *circleBackGroundColor;
    NSInteger circleIndex;
    NSInteger circleNum;
    NSInteger circleTime;
    NSUInteger AdjustedSecondsCompleted;
    NSUInteger AdjustedSecondsTotal;
    NSTimer *circleTimer;
}
@end
@implementation ACircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        circleColor = [UIColor colorWithWhite:1 alpha:1];
        circleBackGroundColor = [UIColor clearColor];
        _circleWidth = 15.0f;
    }
    return self;
}

-(void)start
{
    circleNum = 0;
    circleTime = 20;
    circleIndex = 0;
    circleColor = [UIColor colorWithWhite:1 alpha:1];
    circleBackGroundColor = [UIColor clearColor];
    AdjustedSecondsCompleted = 0;
    AdjustedSecondsTotal = circleTime * SECONDS_ADJUSTMENT;
    [self update];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float radius = CGRectGetWidth(rect)/2.0f - _circleWidth/2.0f;
    float angleOffset = M_PI_2;
    
    //Draw the background of the circle.
    CGContextSetLineWidth(context, _circleWidth);
    CGContextBeginPath(context);
    CGContextAddArc(context,CGRectGetMidX(rect), CGRectGetMidY(rect),radius,0,2*M_PI,0);
    CGContextSetStrokeColorWithColor(context, [circleBackGroundColor CGColor]);
    CGContextStrokePath(context);

    //Draw the remaining amount of timer circle.
    if(circleIndex == 1)
    {
        //Draw the remaining amount of timer circle.
        CGContextSetLineWidth(context, _circleWidth);
        CGContextBeginPath(context);
        CGFloat startAngle = (((CGFloat)AdjustedSecondsCompleted + 1.0f) /
                              ((CGFloat)AdjustedSecondsTotal)*M_PI*2 - angleOffset);
        CGFloat endAngle = 2*M_PI - angleOffset;
        CGContextAddArc(context,
                        CGRectGetMidX(rect), CGRectGetMidY(rect),
                        radius,
                        startAngle,
                        endAngle,
                        0);
        CGContextSetStrokeColorWithColor(context, [circleColor CGColor]);
        CGContextStrokePath(context);
    }
    
    if(circleIndex == 2)
    {
        //Draw Circle
        CGContextSetLineWidth(context, _circleWidth);
        CGContextBeginPath(context);
        CGFloat startAngle = 0.0f - angleOffset;
        CGFloat endAngle = (((CGFloat)AdjustedSecondsCompleted + 1.0f) /
                            ((CGFloat)AdjustedSecondsTotal)*M_PI*2 - angleOffset);
        CGContextAddArc(context,
                        CGRectGetMidX(rect), CGRectGetMidY(rect),
                        radius,
                        startAngle,
                        endAngle,
                        0);
        CGContextSetStrokeColorWithColor(context, [circleColor CGColor]);
        CGContextStrokePath(context);
    }
}

-(void)update
{
    if(circleNum % 2 == 1)
    {
        AdjustedSecondsCompleted += AdjustedSecondsTotal / (circleTime / TIMER_INTERVAL);
        if (AdjustedSecondsCompleted >= AdjustedSecondsTotal)
        {
            circleNum++;
            AdjustedSecondsCompleted = 0;
        }
    }
    
    if(circleNum % 2 == 0)
    {
        AdjustedSecondsCompleted += AdjustedSecondsTotal / (circleTime / TIMER_INTERVAL);
        if (AdjustedSecondsCompleted >= AdjustedSecondsTotal)
        {
            circleNum++;
            AdjustedSecondsCompleted = 0;
        }
    }
    circleTimer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL
                                     target:self
                                   selector:@selector(update)
                                   userInfo:nil
                                    repeats:NO];
    [self setNeedsDisplay];
}

@end
