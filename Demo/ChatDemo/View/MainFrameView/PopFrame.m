//
//  popFrame.m
//  ChatDemo
//
//  Created by 周传祥 on 2018/11/15.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "PopFrame.h"
#import "MasonryVC.h"
@interface PopFrame()
//@property NSArray *img;
//@property NSArray *name;

@end


@implementation PopFrame

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i<_img.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0+44*i, self.bounds.size.width, 44);
        [button setTitle:_name[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:_img[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self addSubview:button];
        if(i<_img.count-1){
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 44+i*44,self.bounds.size.width-40, 1)];
            [view setBackgroundColor:UIColor.whiteColor];
            [self addSubview:view];
        }
    }
}
-(void)buttonClick:(UIButton *)sender{
    //NSLog(@"%ld",sender.tag);
    [_delegate clickedWithButton:sender];
//    执行代理实现的方法（调用父类、父view的响应方法、往回传值 都能用）
}
@end
