//
//  RTViewController.m
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/18/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "MoviesViewController.h"
#import "MovieTableViewCell.h"
#import "Movie.h"
#import "MovieDetailViewController.h"
#import "MBProgressHUD.h"
#import "YRDropdownView.h";


@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *movieList;
@property NSArray *movies;
@property UIRefreshControl *refreshControl;
@end

@implementation MoviesViewController

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
    self.navigationItem.title = @"Movies";
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    NSAttributedString *refreshTitle = [[NSAttributedString alloc] initWithString:@"Release to refresh movies"];
    self.refreshControl.attributedTitle = refreshTitle;
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    
    UIView *refreshview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.movieList insertSubview:refreshview atIndex:0];
    [refreshview addSubview:self.refreshControl];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
    hud.labelText = @"Loading";
    hud.yOffset = -50;
    [self.movieList addSubview:hud];
    [hud showAnimated:YES whileExecutingBlock:^(void) {
        [self loadData];
    }];
    
    self.movieList.dataSource = self;
    self.movieList.rowHeight = 100;
    self.movieList.delegate = self;
    
    [self.movieList registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:nil] forCellReuseIdentifier:@"MovieTableViewCell"];
}

- (void) loadData
{
    [YRDropdownView hideDropdownInView:self.movieList];
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=ysum3nmjmcx8h52wasgft6t7";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if(connectionError == nil)
        {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //NSLog(@"%@", object);
            
            self.movies = [Movie moviesWithArray:object[@"movies"]];
            
            [self.movieList reloadData];
            [self.refreshControl endRefreshing];
        } else
        {
            [YRDropdownView showDropdownInView:self.movieList title:@"Network Error"];
        }
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Movie *currentMovie = self.movies[indexPath.row];
    
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieTableViewCell"];
    cell.title.text = currentMovie.title;
    cell.synopsis.text = currentMovie.synopsis;
    
    [cell.thumbnail setImageWithURLRequest:[NSURLRequest requestWithURL:currentMovie.posterURL] placeholderImage:nil success:NULL failure:NULL];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Movie *currentMovie = self.movies[indexPath.row];
    
    MovieDetailViewController *detail = [[MovieDetailViewController alloc] init];
    detail.movieName = currentMovie.title;
    detail.synopsis = currentMovie.synopsis;
    detail.posterURL = currentMovie.posterURL;
    
    [self.navigationController pushViewController:detail animated:YES];
}

@end
