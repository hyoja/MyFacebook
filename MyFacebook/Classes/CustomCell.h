//
//  CustomCell.h
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 26..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    UILabel *titleLabel;
    UILabel *writedTimeLabel;
    UIImageView *feedImageView;
}
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UILabel *writedTimeLabel;
@property(nonatomic,retain)UIImageView *feedImageView;
@end
