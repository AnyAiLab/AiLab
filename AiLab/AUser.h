//
//  AUser.h
//  AiLab
//
//  Created by huangwf on 14-8-16.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AESCrypt.h"
#import "MersenneTwister.h"

@interface AUser : NSObject
@property(nonatomic,strong)NSString *Username;
@property(nonatomic,strong)NSString *Password;

-(void)addUser;
-(Boolean)UserLogin;

@end
