//
//  ALottery.m
//  AiLab
//
//  Created by huangwf on 14-8-17.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import "ALottery.h"

@implementation ALottery
static ALottery *myLottery = nil;

+(ALottery *)Instance
{
    @synchronized(self) {
        if(myLottery == nil) {
            myLottery = [[[self class] alloc] init];
        }
    }
    return myLottery;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (myLottery == nil) {
            myLottery = [super allocWithZone:zone];
            return  myLottery;
        }
    }
    return nil;
}

-(NSArray *)GenerateLottery
{
    if(_Mt == nil)
    {
        _Mt = [[MersenneTwister alloc]init];
    }
    
    NSMutableArray *blueball = [NSMutableArray arrayWithCapacity:16];
    NSMutableArray *redball = [NSMutableArray arrayWithCapacity:33];
    
    for(int i = 0;i < 33;i++)
    {
        if(i < 16)
        {
            [blueball addObject:[NSString stringWithFormat:@"%d",(i + 1)]];
        }
        [redball addObject:[NSString stringWithFormat:@"%d",(i +1)]];
    }
    
    NSMutableArray *theLottery = [NSMutableArray arrayWithCapacity:7];
    
    //redball
    for(int i = 0; i < 6; i++)
    {
        int redballIndex = [_Mt Generate_MersenneTwister] % (33 - i);
        [theLottery addObject:[redball objectAtIndex:redballIndex]];
        [redball removeObjectAtIndex:redballIndex];
    }
    //blueball
    [theLottery addObject:[blueball objectAtIndex:([_Mt Generate_MersenneTwister] % 16)]];
    
    NSArray *myArray = [theLottery copy];
    return myArray;
}

-(NSString *)GetLastLottery
{
    return nil;
}
@end
