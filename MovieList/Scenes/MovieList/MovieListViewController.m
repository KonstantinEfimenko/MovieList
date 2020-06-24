//
//  MovieListViewController.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieListCell.h"

@interface MovieListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerNib:MovieListCell.nib forCellReuseIdentifier:MovieListCell.reuseKey];
    [_presenter viewDidLoad];
}

- (void)reloadTableView {
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieListCell *cell = (MovieListCell *)[tableView dequeueReusableCellWithIdentifier:MovieListCell.reuseKey];
    if (cell) {
        [cell setMovie: [_presenter movieAtIndexPath:indexPath]];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_presenter numberOfRows];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_presenter didSelectMovieAtIndexPath:indexPath];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [_presenter loadNext];
    }
}

@end
