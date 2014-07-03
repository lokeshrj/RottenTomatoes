//
//  RTViewController.h
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/18/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@end
