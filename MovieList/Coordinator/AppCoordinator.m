//
//  AppCoordinator.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "AppCoordinator.h"
#import "MovieListViewController.h"
#import "MovieDetailsViewController.h"
#import "MovieListNavigation.h"

@implementation AppCoordinator

id<StorageManagerProtocol> _storageManager;
UIWindow *_window;

- (instancetype)initWithStorageManager:(id<StorageManagerProtocol>)storageManager window:(UIWindow *)window {
    self = [super init];
    if (self) {
        _storageManager = storageManager;
        _window = window;
    }
    return self;
}

- (void)start {
    [self showMovieList];
}

- (void)showMovieList {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MovieList" bundle: nil];
    MovieListViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MovieListViewController"];
    MovieListNavigation *navigation = [[MovieListNavigation alloc] init];
    navigation.didSelectMovieWithId = ^(NSInteger movieId){
        [self didSelectMovieWithId:movieId];
    };
        
    MovieListPresenter *presenter = [[MovieListPresenter alloc] initWithStorageManager:_storageManager navigation:navigation];
    vc.presenter = presenter;
    presenter.view = vc;
    
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController: vc];
    [_window makeKeyAndVisible];
}

- (void)didSelectMovieWithId:(NSInteger)movieId {
    [self showMovieDetailsWithMovieId:(NSInteger)movieId];
}

- (void)showMovieDetailsWithMovieId:(NSInteger)movieId {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MovieDetails" bundle:nil];
    MovieDetailsViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MovieDetailsViewController"];
    MovieDetailsPresenter *presenter = [[MovieDetailsPresenter alloc] initWithStorageManager:_storageManager movieId:movieId];
    vc.presenter = presenter;
    presenter.view = vc;
    
    UINavigationController *rootVC = (UINavigationController *) _window.rootViewController;
    [rootVC pushViewController:vc animated:true];
}

@end
