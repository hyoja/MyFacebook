//
//  FeedItem.h
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 26..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FeedData : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *writedTime;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImageView *feedImageView;


@end
