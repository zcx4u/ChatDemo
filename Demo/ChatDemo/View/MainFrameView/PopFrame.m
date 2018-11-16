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
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 0+40.3*i, self.bounds.size.width, 40);
        UIImage *image = [UIImage imageNamed:_img[i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(10, 5, 30, 30);
        [button addSubview:imageView];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(45, 5, 100, 30)];
        lable.text = _name[i];
        [lable setTextColor:UIColor.whiteColor];
        lable.font = [UIFont systemFontOfSize:15];
        [button addSubview:lable];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [button setBackgroundImage:[self imageWithColor:UIColor.blackColor] forState:UIControlStateHighlighted];
        [self addSubview:button];
        if(i<_img.count-1){
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 40+i*40,self.bounds.size.width-20, 0.3)];
            [view setBackgroundColor:UIColor.whiteColor];
            [view setAlpha:0.50f];
            [self addSubview:view];
        }
    }
}
-(void)buttonClick:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
    //[sender setBackgroundColor:UIColor.yellowColor];
    [_delegate clickedWithButton:sender];
//    执行代理实现的方法（调用父类、父view的响应方法、往回传值 都能用）
}

- (UIImage *)imageWithColor:(UIColor *)color
{
//    3     // 描述矩形
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    5
         // 开启位图上下文
        UIGraphicsBeginImageContext(rect.size);
        // 获取位图上下文
         CGContextRef context = UIGraphicsGetCurrentContext();
         // 使用color演示填充上下文
         CGContextSetFillColorWithColor(context, [color CGColor]);
         // 渲染上下文
         CGContextFillRect(context, rect);
        // 从上下文中获取图片
         UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
         // 结束上下文
         UIGraphicsEndImageContext();
    
         return image;
     }


@end
