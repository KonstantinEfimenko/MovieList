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

id<StorageManagerProtocol> _Nullable storage;
NSArray<Movie*>*list;
AppCoordinator* _coordinator;

- (id)initWithStorageManager:(id<StorageManagerProtocol>)storageManager coordinator:(AppCoordinator *)coordinator {
    self = [super init];
    if (self) {
        storage = storageManager;
        _coordinator = coordinator;
    }
    return self;
}

-(NSInteger)numberOfRows {
    return list.count;
}

-(Movie*) movieAtIndexPath:(NSIndexPath*)indexPath {
    return list[indexPath.row];
}

-(void) didSelectMovieAtIndexPath:(NSIndexPath*)indexPath {
    [_coordinator didSelectMovieWithId:list[indexPath.row].movieId];
}

- (void) viewDidLoad {
    [self loadNext];
}

-(void) loadNext {
    __weak typeof(self) weakSelf = self;
    [storage getMoviesWithCompletion:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        list = array;
        [strongSelf.view reloadTableView];
    }];
}

@end
