//
//  MovieListPresenter.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppCoordinator.h"
#import "StorageManager.h"
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MovieListNavigationProtocol <NSObject>

@property (copy) void (^didSelectMovieWithId)(NSInteger);

@end

@protocol MovieListPresenterProtocol <NSObject>

- (NSInteger)numberOfRows;
- (Movie *)movieAtIndexPath:(NSIndexPath *)indexPath;
- (void)viewDidLoad;
- (void)loadNext;
- (void)didSelectMovieAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol MovieListViewProtocol <NSObject>

- (void)reloadTableView;

@end

@interface MovieListPresenter : NSObject <MovieListPresenterProtocol>

@property (weak) id<MovieListViewProtocol> view;

- (instancetype)initWithStorageManager:(id<StorageManagerProtocol>)storageManager navigation:(id<MovieListNavigationProtocol>)navigation;

@end

NS_ASSUME_NONNULL_END
