//
//  Movies.m
//  RottenTomatoes
//
//  Created by Lokesh Jagasia on 6/20/14.
//  Copyright (c) 2014 ljagasia. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id) initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.title = dictionary[@"title"];
        self.synopsis = dictionary[@"synopsis"];
        NSString *posterURLString = dictionary[@"posters"][@"original"];
        self.posterURL = [NSURL URLWithString:posterURLString];
    }
    return self;
}

+ (NSArray *) moviesWithArray:(NSArray *)array
{
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary * movie in array) {
        [movies addObject:[[Movie alloc] initWithDictionary:movie]];
    }
    return movies;
}

@end
