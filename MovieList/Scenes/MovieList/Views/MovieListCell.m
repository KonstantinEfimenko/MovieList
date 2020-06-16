//
//  MovieListCell.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "MovieListCell.h"
@import AFNetworking;

@implementation MovieListCell

+(NSString*)reuseKey {
    return @"MovieListCell";
}

+(UINib*)nib {
    return [UINib nibWithNibName: MovieListCell.reuseKey bundle:nil];
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _titleLabel.text = nil;
    _popularityLabel.text = nil;
    _posterImageView.image = nil;
}

-(void)setMovie:(Movie*)movie {
    _titleLabel.text = movie.title;
    _popularityLabel.text = movie.popularity;
    [_posterImageView setImageWithURL:movie.url];
}
@end
