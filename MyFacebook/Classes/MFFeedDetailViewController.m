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
    
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UIImageView *myImageView;
    UIImageView *detailImageView;
    UIImage *detailImage;
    UILabel *detailTextLabel;
    
    primaryLabel = [[UILabel alloc]init];
    primaryLabel.textAlignment = UITextAlignmentLeft;
    primaryLabel.font = [UIFont systemFontOfSize:14];
    
    secondaryLabel = [[UILabel alloc]init];
    secondaryLabel.textAlignment = UITextAlignmentLeft;
    secondaryLabel.font = [UIFont systemFontOfSize:8];
    
    myImageView = [[UIImageView alloc]init];
    
    detailImageView = [[UIImageView alloc]init];
    
    detailTextLabel = [[UILabel alloc]init];
    detailTextLabel.font = [UIFont systemFontOfSize:10];
    detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    detailTextLabel.numberOfLines = 0;
    
    
    detailImage = [self.feedItem image];
    detailImageView.image = detailImage;
    
    CGRect frame;
    frame= CGRectMake(10 ,85, 50, 50);
    myImageView.frame = frame;
    
    frame= CGRectMake(70 ,90, 200, 25);
    primaryLabel.frame = frame;
    
    frame= CGRectMake(70 ,115, 100, 15);
    secondaryLabel.frame = frame;
    
    frame= CGRectMake(10 ,150, detailImage.size.height, detailImage.size.width);
    detailImageView.frame = frame;
    
    frame= CGRectMake(10 ,180+detailImage.size.width, 370, 400);
    detailTextLabel.frame = frame;
    
    [self.view addSubview:myImageView];
    [self.view addSubview:primaryLabel];
    [self.view addSubview:secondaryLabel];
    [self.view addSubview:detailTextLabel];
    [self.view addSubview:detailImageView];
    
    
    
    primaryLabel.text = [self.feedItem title];
    secondaryLabel.text = [self.feedItem writedTime];
    myImageView.image = [self.feedItem image];
    detailTextLabel.text = [self.feedItem title];
    [detailTextLabel sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
