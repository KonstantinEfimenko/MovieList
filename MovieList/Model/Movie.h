//
//  Movie.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property NSString* title;
@property NSString* popularity;
@property NSString* posterPath;

- (id)initWithDictionary:(NSDictionary*)dictionary;

- (NSURL*) url;

@end

NS_ASSUME_NONNULL_END
