//
//  AUser.m
//  AiLab
//
//  Created by huangwf on 14-8-16.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import "AUser.h"

@implementation AUser


-(void)addUser
{
    MersenneTwister *MT = [[MersenneTwister alloc] init];
    NSInteger intPassword = [MT Generate_MersenneTwister];
    NSString *strPassword = [NSString stringWithFormat:@"%d",intPassword];
    NSString *AEpassword = [AESCrypt encrypt:_Password password:strPassword];
    [self SaveUser:strPassword UserPassword:AEpassword];
}

-(Boolean)UserLogin
{
    NSUserDefaults *personDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *unPersonArray = [personDefaults objectForKey:_Username];
    if(unPersonArray.count == 2)
    {
        NSString *UAEpassword = [AESCrypt decrypt:[unPersonArray objectAtIndex:1] password:[NSString stringWithFormat:@"%d",([[unPersonArray objectAtIndex:0] intValue] - 1)]];
        if((_Password != nil) && ([_Password compare:UAEpassword options:NSLiteralSearch] == NSOrderedAscending))
        {
            return true;
        }
    }
    return false;
}

-(void)SaveUser:(NSString *)password UserPassword:(NSString *)aePassword
{
    NSMutableArray *personArray=[[NSMutableArray alloc]init];
    [personArray addObject:[NSString stringWithFormat:@"%d",([password intValue] + 1)]];
    [personArray addObject:aePassword];
    
    NSUserDefaults *personDefaults = [NSUserDefaults standardUserDefaults];
    [personDefaults setObject:personArray forKey:_Username];
}

@end
