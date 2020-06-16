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

@end

@protocol MovieDetailsViewProtocol <NSObject>

@end

@interface MovieDetailsPresenter : NSObject <MovieDetailsPresenterProtocol>

@property (weak) id<MovieDetailsViewProtocol> view;
- (id)initWithStorageManager:(id<StorageManagerProtocol>)storageManager;

@end

NS_ASSUME_NONNULL_END
