//
//  SceneDelegate.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppCoordinator.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (id<CoordinatorProtocol>) applicationCoordinator {
    
    StorageManager* storageManager = [[StorageManager alloc] init];
    
    AppCoordinator* coordinator = [[AppCoordinator alloc] initWithStorageManager: storageManager window: _window];
    return coordinator;
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
     id<CoordinatorProtocol> coordinator = [self applicationCoordinator];
       
       [coordinator start];
}
@end
