//
//  movieTableViewCell.h
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/18/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *synopsis;

@end
