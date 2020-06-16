//
//  MovieDetailsPresenter.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "MovieDetailsPresenter.h"

@implementation MovieDetailsPresenter

id<StorageManagerProtocol> _Nullable _storageManager;
NSInteger _movieId;

- (id)initWithStorageManager:(id<StorageManagerProtocol>)storageManager movieId:(NSInteger)movieId {
    self = [super init];
    if (self) {
        _storageManager = storageManager;
        _movieId = movieId;
    }
    return self;
}

-(void) viewDidLoad {
    __weak typeof(self) weakSelf = self;
    
    [_storageManager getMovieDetailsWithId:_movieId completion:^(MovieDetails* movieDetails) {
        __strong typeof(self) strongSelf = weakSelf;
        if (movieDetails) {
            [strongSelf fillViewWithMovieDetails:movieDetails];
        }
    }];
}

-(void) fillViewWithMovieDetails:(MovieDetails*)movieDetails {
    [_view setTitle:movieDetails.title];
    [_view setTagline:movieDetails.tagline];
    [_view setOverview:movieDetails.overview];
}

@end
