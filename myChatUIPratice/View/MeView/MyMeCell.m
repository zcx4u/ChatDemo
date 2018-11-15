//
//  meCell.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/10/23.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "MyMeCell.h"
@implementation MyMeCell

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
        
        CGRect fram = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 80);
        self.frame = fram;
        CGFloat height = self.frame.size.height;
        CGFloat photoImgWidth = 60;
        CGFloat photoImgHeight = 60;
        CGFloat imgLeftSpace =15;
        _photo = [[UIImageView alloc]initWithFrame:CGRectMake(imgLeftSpace, (height-photoImgHeight)/2, photoImgWidth, photoImgHeight)];
        _photo.layer.cornerRadius = 5;
        _photo.layer.masksToBounds = YES;
        [self addSubview:_photo];
        
        CGFloat  nameHeight = 21;
        CGFloat nameWidth = 120;
        CGFloat lableLeftSpace = 90;
        _name = [[UILabel alloc]initWithFrame:CGRectMake(lableLeftSpace, (self.frame.origin.y+self.frame.size.height/3-10), nameWidth, nameHeight)];
        [self addSubview:_name];
        
        CGFloat  infoHeight = 21;
        CGFloat infoWidth = 220;
        //CGFloat lableLeftSpace = 49.5;
        _info = [[UILabel alloc]initWithFrame:CGRectMake(lableLeftSpace, (self.frame.origin.y+self.frame.size.height/3*2-10), infoWidth, infoHeight)];
        _info.font = [UIFont systemFontOfSize:13];
        [self addSubview:_info];
        
        CGFloat QRcodeImgWidth = 20;
        CGFloat QRcodeImgHeight = 20;
        CGFloat QRcodeSpace = 1;
        _QRcode = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-QRcodeSpace, (height-QRcodeImgHeight)/2, QRcodeImgWidth, QRcodeImgHeight)];
        [self addSubview:_QRcode];
        
    }
    return self;
}

@end
