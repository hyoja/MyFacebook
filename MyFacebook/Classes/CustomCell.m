//
//  CustomCell.m
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 26..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell

@synthesize titleLabel,writedTimeLabel,feedImageView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        titleLabel = [[UILabel alloc]init];
        titleLabel.textAlignment = UITextAlignmentLeft;
        titleLabel.font = [UIFont systemFontOfSize:14];
        
        writedTimeLabel = [[UILabel alloc]init];
        writedTimeLabel.textAlignment = UITextAlignmentLeft;
        writedTimeLabel.font = [UIFont systemFontOfSize:8];
        
        feedImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:writedTimeLabel];
        [self.contentView addSubview:feedImageView];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX+10 ,5, 50, 50);
    feedImageView.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,10, 200, 25);
    titleLabel.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,35, 100, 15);
    writedTimeLabel.frame = frame;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
