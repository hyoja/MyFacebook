//
//  FeedViewController.m
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 25..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import "MFFeedViewController.h"
#import "MFFeedDetailViewController.h"

#import "CustomCell.h"
#import "FeedItem.h"

@implementation MFFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Feeds";
    [self cofigureTableview];
    
    self.cellData = [[NSMutableArray alloc]init];
    
    if ([FBSDKAccessToken currentAccessToken]){
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/feed?fields=picture,created_time,message,id" parameters:nil]
         
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error){
             if (!error){
                 for (NSDictionary *graphAPIData in [result objectForKey:@"data"]){
                     
                     FeedItem *feed = [[FeedItem alloc]init];
                     
                     NSString *createdTime = [graphAPIData objectForKey:@"created_time"];
                     NSString *picture = [graphAPIData objectForKey:@"picture"];
                     NSString *message = [graphAPIData objectForKey:@"message"];
                     
                     [feed setWritedTime:createdTime];
                     [feed setTitle:message];
                     
                     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                         
                         feed.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:picture]]];
                         
                         dispatch_async(dispatch_get_main_queue(), ^ {
                             feed.targetImageView.image = feed.image;
                             [feed.targetImageView setNeedsDisplay];
                         });
                     });

                     [self.cellData addObject:feed];
                 }
                 
                 [self.table reloadData];
             }
         }];
    }
}

- (void)cofigureTableview
{
    self.table = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";

    CustomCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];

    if(cell == nil)
    {
        cell = [[[CustomCell alloc] init]
                                        initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier];
    }
    
    FeedItem *feedItemCell = (FeedItem *)[self.cellData objectAtIndex:indexPath.row];
    cell.titleLabel.text = [feedItemCell title];
    cell.writedTimeLabel.text = [feedItemCell writedTime];
    
    if(feedItemCell.image != nil)
    {
        cell.feedImageView.image = [feedItemCell image];
    }
    else
    {
        feedItemCell.targetImageView = cell.feedImageView;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailViewController = [[MFFeedDetailViewController alloc] initWith:[self.cellData objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    const int TABLE_CELL_HEIGHT = 60;
    return TABLE_CELL_HEIGHT;
}

@end