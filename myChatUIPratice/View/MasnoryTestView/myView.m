//
//  myView.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/11/1.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "myView.h"

@implementation myView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    NSLog(@"frame = %@", NSStringFromCGRect(frame));
}
- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    NSLog(@"bounds = %@", NSStringFromCGRect(bounds));
}
- (void)setCenter:(CGPoint)center {
    [super setCenter:center];
    NSLog(@"center = %@", NSStringFromCGPoint(center));
}
@end
