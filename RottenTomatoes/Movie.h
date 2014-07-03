//
//  Movies.h
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/20/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSURL *posterURL;
@property (nonatomic, strong) NSURL *thumbnailURL;

- (id) initWithDictionary:(NSDictionary *) dictionary;
+ (NSArray *) moviesWithArray:(NSArray *) array;

@end
