//
//  StorageManager.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieDetails.h"

@protocol StorageManagerProtocol <NSObject>

- (void)getMoviesWithCompletion:(void(^)(NSArray *))callback;

- (void)getMovieDetailsWithId:(NSInteger)movieId completion:(void(^)(MovieDetails *))callback;

@end

NS_ASSUME_NONNULL_BEGIN

@interface StorageManager : NSObject <StorageManagerProtocol>

@end

NS_ASSUME_NONNULL_END
