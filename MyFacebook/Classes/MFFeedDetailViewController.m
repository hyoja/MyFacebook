//
//  MFFeedDetailViewController.m
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 25..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import "MFFeedDetailViewController.h"

@implementation MFFeedDetailViewController

-(id)initWith:(FeedItem *)feedContents
{
    self = [super init];
    if(self != nil)
    {
        self.feedItem = feedContents;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titileLabel;
    UILabel *writedTimeLabel;
    UIImageView *smallImageView;
    UIImageView *detailImageView;
    UILabel *detailTextLabel;
    
    titileLabel = [[UILabel alloc]init];
    titileLabel.textAlignment = NSTextAlignmentLeft;
    titileLabel.font = [UIFont systemFontOfSize:14];
    
    writedTimeLabel = [[UILabel alloc]init];
    writedTimeLabel.textAlignment = NSTextAlignmentLeft;
    writedTimeLabel.font = [UIFont systemFontOfSize:8];
    
    smallImageView = [[UIImageView alloc]init];
    
    detailImageView = [[UIImageView alloc]init];
    
    detailTextLabel = [[UILabel alloc]init];
    detailTextLabel.font = [UIFont systemFontOfSize:10];
    detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    detailTextLabel.numberOfLines = 0;
    
    detailImageView.image = [self.feedItem image];
    
    CGRect frame;
    frame= CGRectMake(10 ,85, 50, 50);
    smallImageView.frame = frame;
    
    frame= CGRectMake(70 ,90, 200, 25);
    titileLabel.frame = frame;
    
    frame= CGRectMake(70 ,115, 100, 15);
    writedTimeLabel.frame = frame;
    
    float feedImageHeight = [self.feedItem image].size.height;
    float feedImageWidth = [self.feedItem image].size.width;
    
    frame= CGRectMake(10 ,150, feedImageHeight, feedImageWidth);
    detailImageView.frame = frame;
    
    frame= CGRectMake(10 ,180 + feedImageWidth, 370, 400);
    detailTextLabel.frame = frame;
    
    [self.view addSubview:smallImageView];
    [self.view addSubview:titileLabel];
    [self.view addSubview:writedTimeLabel];
    [self.view addSubview:detailTextLabel];
    [self.view addSubview:detailImageView];
    
    titileLabel.text = [self.feedItem title];
    writedTimeLabel.text = [self.feedItem writedTime];
    smallImageView.image = [self.feedItem image];
    detailTextLabel.text = [self.feedItem title];
    [detailTextLabel sizeToFit];
}

@end