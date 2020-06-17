//
//  MovieListCell.h
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListCell : UITableViewCell

+(NSString*) reuseKey;

+(UINib*) nib;

-(void)setMovie:(Movie*)movie;

@end

NS_ASSUME_NONNULL_END
