//
//  CustomCell.h
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 26..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UIImageView *myImageView;
}
@property(nonatomic,retain)UILabel *primaryLabel;
@property(nonatomic,retain)UILabel *secondaryLabel;
@property(nonatomic,retain)UIImageView *myImageView;
@end
