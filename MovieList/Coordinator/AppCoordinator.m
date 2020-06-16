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

@implementation AppCoordinator

id<StorageManagerProtocol> _storageManager;
UIWindow* _window;

-(id)initWithStorageManager:(id<StorageManagerProtocol>)storageManager window:(UIWindow*) window {
    self = [super init];
    if (self) {
        _storageManager = storageManager;
        _window = window;
    }
    return self;
}

- (void) start {
    [self showMovieList];
}

- (void) showMovieList {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MovieList" bundle: nil];
    MovieListViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"MovieListViewController"];
    MovieListPresenter* presenter = [[MovieListPresenter alloc] initWithStorageManager:_storageManager coordinator:self];
    vc.presenter = presenter;
    presenter.view = vc;
    
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController: vc];
    [_window makeKeyAndVisible];
}

-(void)didSelectMovie:(Movie*)movie {
    [self showMovieDetails];
}

- (void)showMovieDetails {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MovieDetails" bundle: nil];
    MovieDetailsViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"MovieDetailsViewController"];
    MovieDetailsPresenter* presenter = [[MovieDetailsPresenter alloc] initWithStorageManager:_storageManager];
    vc.presenter = presenter;
    presenter.view = vc;
    
    UINavigationController* rootVC = (UINavigationController*) _window.rootViewController;
    [rootVC pushViewController:vc animated:true];
}

@end
