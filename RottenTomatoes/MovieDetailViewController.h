//
//  MovieDetailViewController.h
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/25/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (nonatomic) NSString *movieName;
@property (nonatomic) NSString *synopsis;
@property (weak, nonatomic) IBOutlet UIView *slidingView;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (nonatomic) NSURL *posterURL;
@end
