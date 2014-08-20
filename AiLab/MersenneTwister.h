//
//  MersenneTwister.h
//  AllLab
//
//  Created by huangwf on 14-7-27.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MersenneTwister : NSObject

-(id)init;
-(void)initSeed:(NSInteger)seed;
-(NSInteger)Generate_MersenneTwister;
@end
