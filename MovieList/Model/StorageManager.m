//
//  StorageManager.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "StorageManager.h"
@import AFNetworking;
#import "Movie.h"

@implementation StorageManager

NSMutableArray* movies = nil;
AFHTTPSessionManager *sessionManager = nil;
int page = 0;
bool isLoading = false;
NSDictionary*movieDetailsParameters;
NSString* apiKey = @"c2633d90b16883396aece840fd550cf6";
NSString* defaultLanguage = @"en-US";

- (id)init {
    self = [super init];
    if (self) {
        movies = [[NSMutableArray alloc] init];
        sessionManager = [AFHTTPSessionManager manager];
        movieDetailsParameters = @{@"api_key": apiKey,
                                   @"language": defaultLanguage};
    }

    return self;
}

- (void) getMoviesWithCompletion:(void(^)(NSArray*))callback {
    
    if (isLoading) {
        callback(nil);
        return;
    }
    page++;
    isLoading = true;
    
    NSDictionary *parameters = @{@"api_key": apiKey,
                                 @"language": defaultLanguage,
                                 @"page": @(page)};
    
    [sessionManager GET:@"https://api.themoviedb.org/3/movie/popular"
             parameters:parameters
                headers:nil
               progress:nil
                success:^(NSURLSessionTask *task, id responseObject) {
        NSMutableArray*resultArray = [[NSMutableArray alloc] init];
        NSArray*results = responseObject[@"results"];
        for (NSDictionary *dic in results) {
            Movie*movie = [[Movie alloc] initWithDictionary:dic];
            [resultArray addObject:movie];
        }
        [movies addObjectsFromArray:resultArray];
        callback(movies);
        isLoading = false;
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        callback(nil);
        isLoading = false;
    }];
}

-(void) getMovieDetailsWithId:(NSInteger)movieId completion:(void(^)(MovieDetails*))callback {
    NSString* urlString = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@", @(movieId)];
    
    [sessionManager GET:urlString
             parameters:movieDetailsParameters
                headers:nil
               progress:nil
                success:^(NSURLSessionTask *task, id responseObject) {
        MovieDetails* movieDetails = [[MovieDetails alloc] initWithDictionary:responseObject];
        callback(movieDetails);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        callback(nil);
    }];
}

@end
