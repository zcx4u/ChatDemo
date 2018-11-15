//
//  friendsCircleCell.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/10/23.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "FriendsCircleCell.h"

@implementation FriendsCircleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGFloat height = self.frame.size.height;
        CGFloat rightImgWidth = 28;
        CGFloat leftImgHeight = 28;
        CGFloat imgLeftSpace = 320;
        _rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(imgLeftSpace, (height-leftImgHeight)/2, rightImgWidth, leftImgHeight)];
        
        [self addSubview:_rightImage];
    }
    return self;
}

@end
