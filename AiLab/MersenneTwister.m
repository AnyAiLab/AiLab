//
//  MersenneTwister.m
//  AllLab
//
//  Created by huangwf on 14-7-27.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import "MersenneTwister.h"

@implementation MersenneTwister
NSInteger Seed;
BOOL isInit;
int Index;
int MT[624];

-(id)init
{
    self = [super init];
    if(self)
    {
        Seed = 0;
        isInit = NO;
        Index = 0;
        memset(MT, 0, sizeof(int)*624);
    }
    return self;
}

-(void)initSeed:(NSInteger)seed
{
        MT[0] = seed;
        for(int i=1;i<624;i++)
        {
            MT[i] = (1812433253 * (MT[i-1] ^ (MT[i-1] >> 30)) + i)& 0xffffffff;
        }
        isInit = YES;
        Seed = seed;
}

-(NSInteger)Generate_MersenneTwister
{
    if(!isInit)
    {
        [self initSeed:[self getSecond]];
    }
    
    if(index == 0)
    {
        [self Init_MersenneTwister];
    }
    
    NSInteger y = MT[Index];
    y = y ^ (y >> 11);
    y = y ^ ((y << 7) & 2636928640);
    y = y ^ ((y << 15) & 4022730752);
    y = y ^ (y >> 18);
    Index = (Index + 1) % 624;
    return y;
}

-(void)Init_MersenneTwister
{
    for(int i = 0;i < 624;i++)
    {
        int y = (MT[i] & 0x80000000) + (MT[(i+1) % 624] & 0x7fffffff);
        MT[i] = MT[(i + 397) % 624] ^ (y >> 1);
        if (y % 2)
        {
            MT[i] = MT[i] ^ (2567483615);
        }
    }
}

-(NSInteger)getSecond
{
    NSDate* now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger second = [dateComponent second];
    return second;
}

@end
