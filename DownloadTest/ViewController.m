//
//  ViewController.m
//  DownloadTest
//
//  Created by MacBook Pro on 11.07.2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

#import "ViewController.h"
#import "DataLoader.h"
#import "Flight.h"

@interface ViewController (){
    DataLoader * loader;
    NSArray * flights;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    loader = [[DataLoader alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass: [UITableViewCell self] forCellReuseIdentifier:@"flightCell"];
    [loader getFlightsWithCompletion:^(NSArray * flightsArray){
        flights = flightsArray;
        [self.tableView reloadData];
    }];
}

-(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"flightCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"flightCell"];
    }
    Flight * flight = flights[indexPath.row];
    cell.textLabel.text = flight.airline;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return [flights count];
}

@end
