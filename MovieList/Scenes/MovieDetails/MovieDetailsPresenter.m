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

- (id)initWithStorageManager:(id<StorageManagerProtocol>)storageManager {
    self = [super init];
    if (self) {
        _storageManager = storageManager;
    }
    return self;
}

@end
