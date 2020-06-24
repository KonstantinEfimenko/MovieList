//
//  MovieDetailsViewController.m
//  MovieList
//
//  Created by Kostiantyn IEFYMENKO on 15.06.20.
//  Copyright © 2020 Kostiantyn YEFYMENKO. All rights reserved.
//

#import "MovieDetailsViewController.h"

@interface MovieDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self clearScreen];
    [_presenter viewDidLoad];
}

- (void)clearScreen {
    _taglineLabel.text = nil;
    _overviewLabel.text = nil;
}

- (void)setTitle:(NSString *)title {
    [self.navigationItem setTitle:title];
}

- (void)setTagline:(NSString *)tagline {
    _taglineLabel.text = tagline;
}

- (void)setOverview:(NSString *)overview {
    _overviewLabel.text = overview;
}

@end
