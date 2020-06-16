//
//  AppDelegate.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "AppDelegate.h"
#import "AppCoordinator.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (id<CoordinatorProtocol>) applicationCoordinator {
    
    StorageManager* storageManager = [[StorageManager alloc] init];
    
    UIWindow*window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    AppCoordinator* coordinator = [[AppCoordinator alloc] initWithStorageManager: storageManager window: window];
    return coordinator;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if(@available(iOS 13, *)) {
        //Scene delegate is using
    } else {
        [[self applicationCoordinator] start];
    }
    return YES;
}

@end
