//
//  MovieDetailsPresenter.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MovieDetailsPresenterProtocol <NSObject>

- (void)viewDidLoad;

@end

@protocol MovieDetailsViewProtocol <NSObject>

- (void)setTitle:(NSString *)title;
- (void)setTagline:(NSString *)tagline;
- (void)setOverview:(NSString *)overview;

@end

@interface MovieDetailsPresenter : NSObject <MovieDetailsPresenterProtocol>

@property (weak) id<MovieDetailsViewProtocol> view;

- (instancetype)initWithStorageManager:(id<StorageManagerProtocol>)storageManager movieId:(NSInteger)movieId;

@end

NS_ASSUME_NONNULL_END
