//
//  MovieDetails.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 16.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "MovieDetails.h"

@implementation MovieDetails

- (id)initWithDictionary:(NSDictionary*)dictionary; {
    self = [super init];
    if (self) {
        _title = dictionary[@"title"];
        _tagline = dictionary[@"tagline"];
        _overview = dictionary[@"overview"];
    }
    return self;
}

@end
