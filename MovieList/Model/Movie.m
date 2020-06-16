//
//  Movie.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        _title = dictionary[@"title"];
        _popularity = [dictionary[@"popularity"] stringValue];
        _posterPath = dictionary[@"poster_path"];
    }
    return self;
}

-(NSURL*)url {
    NSString*urlString = [NSString stringWithFormat: @"http://image.tmdb.org/t/p/w154/%@", _posterPath];
    return [NSURL URLWithString: urlString];
}

@end
