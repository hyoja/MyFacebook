//
//  MFFeedDetailViewController.m
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 25..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import "MFFeedDetailViewController.h"

@implementation MFFeedDetailViewController

-(id)initWith:(FeedData *)passedFeedData
{
    self = [super init];
    if(self != nil)
    {
        self.feedData = passedFeedData;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureFeedDetailView];
}

- (void) configureFeedDetailView
{
    self.title = @"Detail";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titileLabel = [[UILabel alloc]init];
    UILabel *writedTimeLabel = [[UILabel alloc]init];
    UIImageView *smallImageView = [[UIImageView alloc]init];
    UIImageView *detailImageView = [[UIImageView alloc]init];
    UILabel *detailTextLabel = [[UILabel alloc]init];
    
    titileLabel.textAlignment = NSTextAlignmentLeft;
    titileLabel.font = [UIFont systemFontOfSize:14];
    
    writedTimeLabel.textAlignment = NSTextAlignmentLeft;
    writedTimeLabel.font = [UIFont systemFontOfSize:8];
    
    detailTextLabel.font = [UIFont systemFontOfSize:10];
    detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    detailTextLabel.numberOfLines = 0;
    
    detailImageView.image = self.feedData.image;
    
    CGRect frame;
    frame= CGRectMake(10 ,85, 50, 50);
    smallImageView.frame = frame;
    
    frame= CGRectMake(70 ,90, 200, 25);
    titileLabel.frame = frame;
    
    frame= CGRectMake(70 ,115, 100, 15);
    writedTimeLabel.frame = frame;
    
    float feedImageHeight = self.feedData.image.size.height;
    float feedImageWidth = self.feedData.image.size.width;
    
    frame= CGRectMake(10 ,150, feedImageHeight, feedImageWidth);
    detailImageView.frame = frame;
    
    frame= CGRectMake(10 ,180 + feedImageWidth, 370, 400);
    detailTextLabel.frame = frame;
    
    titileLabel.text = self.feedData.title;
    writedTimeLabel.text = self.feedData.writedTime;
    smallImageView.image = self.feedData.image;
    detailTextLabel.text = self.feedData.title;
    [detailTextLabel sizeToFit];
    
    [self.view addSubview:smallImageView];
    [self.view addSubview:titileLabel];
    [self.view addSubview:writedTimeLabel];
    [self.view addSubview:detailTextLabel];
    [self.view addSubview:detailImageView];
}

@end