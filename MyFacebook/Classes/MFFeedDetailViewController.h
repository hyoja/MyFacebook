//
//  MFFeedDetailViewController.h
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 25..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"

@interface MFFeedDetailViewController : UIViewController

@property (strong, nonatomic) FeedItem* feedItem;

-(id)initWith:(FeedItem *)feedContents;

@end
