//
//  CustomCell.m
//  MyFacebook
//
//  Created by 이효근 [Hyoja] on 2016. 10. 26..
//  Copyright © 2016년 NEXON Korea Corporation. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell

@synthesize primaryLabel,secondaryLabel,myImageView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:8];
        myImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:myImageView];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX+10 ,5, 50, 50);
    myImageView.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,10, 200, 25);
    primaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+70 ,35, 100, 15);
    secondaryLabel.frame = frame;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
