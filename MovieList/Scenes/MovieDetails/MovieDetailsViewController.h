//
//  MovieDetailsViewController.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailsPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailsViewController : UIViewController <MovieDetailsViewProtocol>

@property id<MovieDetailsPresenterProtocol> _Nullable presenter;

@end

NS_ASSUME_NONNULL_END
