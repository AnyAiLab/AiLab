//
//  ALottery.h
//  AiLab
//
//  Created by huangwf on 14-8-17.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MersenneTwister.h"

@interface ALottery : NSObject
@property(nonatomic,strong) MersenneTwister *Mt;
@property(nonatomic,strong) NSString *LastLottery;

+(ALottery *)Instance;
-(NSArray *)GenerateLottery;
-(NSString *)GetLastLottery;
@end
