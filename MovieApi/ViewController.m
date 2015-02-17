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
@end

@implementation ViewController

@synthesize tableList;


- (void)viewDidLoad {
    [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
    tableList = [[NSArray alloc] initWithObjects:@"Chelsea",@"Manchester United", nil];
    self.tableList = tableList;
    self.moviePlayer = [[MPMoviePlayerController alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableList count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell = [tableView   dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }
    NSInteger row = [indexPath row];
    NSString *rowString = [tableList objectAtIndex:row];
    cell.textLabel.text = rowString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"This happened");
}



@end




