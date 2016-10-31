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
#import "FeedData.h"

@implementation MFFeedViewController
{
@private
    bool isRequestDone;
    NSString *nextFeedPagePath;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isRequestDone = YES;
    nextFeedPagePath = @"";
    
    self.title = @"Feeds";
    [self configureTableView];
    
    self.feedDataArray = [[NSMutableArray alloc]init];
    
    NSString* const FEED_REQUEST_GRAPH_PATH = @"me/feed?fields=picture,created_time,message,id";
    [self requestGraphAPI:FEED_REQUEST_GRAPH_PATH];
}

- (void)configureTableView
{
    self.feedTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    self.feedTableView.delegate = self;
    self.feedTableView.dataSource = self;
    [self.view addSubview:self.feedTableView];
}

- (void)requestGraphAPI:(NSString*)graphPath
{
    if ([FBSDKAccessToken currentAccessToken] && isRequestDone == YES){
        isRequestDone = NO;
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:graphPath parameters:nil]
         
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error){
             
             isRequestDone = YES;
             if (!error){
                 [self findNextFeedPagePath:result];
                 [self fillFeedTableView:result];
             }
             
         }];
    }
}

-(void) findNextFeedPagePath:(id)result
{
    nextFeedPagePath = [[result objectForKey:@"paging"] objectForKey:@"next"];
    
    if(nextFeedPagePath != nil){
        int count = 0;
        int index = -1;
        for (unsigned int i = 0; i < [nextFeedPagePath length]; ++i)
        {
            if ([nextFeedPagePath characterAtIndex:i] == '/')
            {
                count++;
                if (count == 4)
                {
                    index = i;
                    break;
                }
            }
        }
        if(index > -1) {
            nextFeedPagePath = [nextFeedPagePath substringFromIndex:index + 1];
        } else {
            nextFeedPagePath = nil;
        }
    }
}

- (void) fillFeedTableView:(id)result
{
    for (NSDictionary *graphAPIData in [result objectForKey:@"data"]){
        
        FeedData *feedData = [[FeedData alloc]init];
        
        NSString *writedTime = [graphAPIData objectForKey:@"created_time"];
        NSString *picture = [graphAPIData objectForKey:@"picture"];
        NSString *message = [graphAPIData objectForKey:@"message"];
        
        [feedData setWritedTime:writedTime];
        [feedData setTitle:message];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            feedData.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:picture]]];
            
            dispatch_async(dispatch_get_main_queue(), ^ {
                feedData.feedImageView.image = feedData.image;
                [feedData.feedImageView setNeedsDisplay];
            });
        });
        
        [self.feedDataArray addObject:feedData];
    }
    
    [self.feedTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailViewController = [[MFFeedDetailViewController alloc] initWith:[self.feedDataArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    const int TABLE_CELL_HEIGHT = 60;
    return TABLE_CELL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.feedDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    CustomCell *customCell = [self.feedTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(customCell == nil)
    {
        customCell = [[[CustomCell alloc] init]
                      initWithStyle:UITableViewCellStyleDefault
                      reuseIdentifier:cellIdentifier];
    }
    
    FeedData *loadedFeedData = (FeedData *)[self.feedDataArray objectAtIndex:indexPath.row];
    customCell.titleLabel.text = loadedFeedData.title;
    customCell.writedTimeLabel.text = loadedFeedData.writedTime;
    
    if(loadedFeedData.image != nil) // it need for async task.
    {
        customCell.feedImageView.image = loadedFeedData.image;
    }
    else
    {
        loadedFeedData.feedImageView = customCell.feedImageView;
    }
    return customCell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat height = scrollView.frame.size.height;
    CGFloat contentYoffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    
    if(distanceFromBottom < height)
    {
        if(isRequestDone == YES)
        {
            [self requestGraphAPI:nextFeedPagePath];
        }
    }
}

@end