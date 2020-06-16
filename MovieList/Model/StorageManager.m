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

- (id)init {
    self = [super init];
    if (self) {
        movies = [[NSMutableArray alloc] init];
        sessionManager = [AFHTTPSessionManager manager];
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
    
    NSDictionary *parameters = @{@"api_key": @"c2633d90b16883396aece840fd550cf6",
                                 @"language": @"en-US",
                                 @"page": @(page)};
    
    [sessionManager GET:@"https://api.themoviedb.org/3/movie/popular"
             parameters:parameters headers:nil
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

@end
