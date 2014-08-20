//
//  AAppDelegate.h
//  AiLab
//
//  Created by huangwf on 14-8-14.
//  Copyright (c) 2014年 huangwf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
