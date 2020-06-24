//
//  MovieDetails.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 16.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetails : NSObject

@property NSString *title;
@property NSString *tagline;
@property NSString *overview;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
