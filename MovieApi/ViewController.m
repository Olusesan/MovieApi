//
//  ViewController.m
//  MovieApi
//
//  Created by Olusesan Ajina on 1/25/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic,strong) NSArray *videolist;
@end

@implementation ViewController

@synthesize tableList;


- (void)viewDidLoad {
    [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
    self.tableList = @[@"Chelsea",
                       @"Manchester United",
                       @"Hello!",
                       @"How are you?",
                       @"Goodbye!",
                       ];

    self.videolist = @[@"https://s3-us-west-2.amazonaws.com/sesan/prog_index.m3u8",
                       @"https://s3-us-west-2.amazonaws.com/sesan/prog_index.m3u8",
                       @"https://s3-us-west-2.amazonaws.com/sesan/prog_index.m3u8",
                       @"https://s3-us-west-2.amazonaws.com/sesan/prog_index.m3u8",
                       @"https://s3-us-west-2.amazonaws.com/sesan/prog_index.m3u8"];
    

    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableList count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell = [tableView   dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }

    // Find the index you're at:
    NSUInteger index = indexPath.row;

    // Find the title for that index, according to our "tableList"
    NSString *titleForCell = [self.tableList objectAtIndex:index];

    // Take that title, and put it in the cell:
    cell.textLabel.text = titleForCell;

    // Return the cell for this method:
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Find our index from the given indexPath
    NSUInteger index = indexPath.row;

    // Find the video URL for that index.
    NSString *videoLinkURLString = [self.videolist objectAtIndex:index];

    // Create a URL out of that string.
    NSURL *videoURL = [NSURL URLWithString:videoLinkURLString];

    // Use this URL and give it to the movie player
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    
    [self.view addSubview:self.moviePlayer.view];

    [self.moviePlayer setFullscreen:YES];

    // Play the movie player.
    [self.moviePlayer play];

}



@end




