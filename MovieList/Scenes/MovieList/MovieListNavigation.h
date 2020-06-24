//
//  MovieListNavigation.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 23.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieListPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListNavigation : NSObject <MovieListNavigationProtocol>

@property (copy) void (^didSelectMovieWithId)(NSInteger);

@end

NS_ASSUME_NONNULL_END
