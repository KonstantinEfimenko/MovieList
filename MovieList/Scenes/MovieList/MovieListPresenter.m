//
//  MovieListPresenter.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "MovieListPresenter.h"
#import <UIKit/UIKit.h>

@implementation MovieListPresenter

__weak id<StorageManagerProtocol> _Nullable storage;
NSArray<Movie *> *list;
id<MovieListNavigationProtocol> _navigation;

- (instancetype)initWithStorageManager:(id<StorageManagerProtocol>)storageManager navigation:(id<MovieListNavigationProtocol>)navigation {
    self = [super init];
    if (self) {
        storage = storageManager;
        _navigation = navigation;
    }
    return self;
}

- (NSInteger)numberOfRows {
    return list.count;
}

- (Movie *)movieAtIndexPath:(NSIndexPath *)indexPath {
    return list[indexPath.row];
}

- (void)didSelectMovieAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger movieId = list[indexPath.row].movieId;
    _navigation.didSelectMovieWithId(movieId);
}

- (void)viewDidLoad {
    [self loadNext];
}

- (void)loadNext {
    __weak typeof(self) weakSelf = self;
    [storage getMoviesWithCompletion:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        list = array;
        [strongSelf.view reloadTableView];
    }];
}

@end
