//
//  MovieDetailViewController.m
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/25/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = self.movieName;
    [self.posterImageView setImageWithURL:self.posterURL];
    self.movieNameLabel.text = self.movieName;
    self.synopsisLabel.text = self.synopsis;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
