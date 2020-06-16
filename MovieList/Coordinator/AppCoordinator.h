//
//  AppCoordinator.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StorageManager.h"
#import "Movie.h"

@protocol CoordinatorProtocol <NSObject>
- (void) start;
@end

NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : NSObject  <CoordinatorProtocol>
-(id)initWithStorageManager:(id<StorageManagerProtocol>)storageManager window: (UIWindow *) window;

-(void)didSelectMovie:(Movie*)movie;
@end

NS_ASSUME_NONNULL_END
