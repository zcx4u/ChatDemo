//
//  masonryVC.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/10/31.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "MasonryVC.h"
#import "Masonry.h"
#import "MyView.h"
@interface MasonryVC ()
@property MyView *view1;
@end

@implementation MasonryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:UIColor.grayColor];
     _view1 = [[MyView alloc]init];
    //[_view1 setBackgroundColor:UIColor.yellowColor];
//    UIImage *myImage = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://127.0.0.1/123.png"]]];
//    UIImageView *image = [[UIImageView alloc]initWithImage:myImage];
    [self.view addSubview:_view1];
//    [_view1 addSubview:image];
    UIView *view2 = [[UIView alloc]init];
    [view2 setBackgroundColor:UIColor.redColor];
    [self.view addSubview:view2];
    
    UIView *view3 = [[UIView alloc]init];
    [view3 setBackgroundColor:UIColor.blueColor];
    [self.view addSubview:view3];
#pragma mark -- 使用水平方向、垂直方向的平均分布
    //    垂直方向平均分布
    [@[_view1,view2] mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:30 leadSpacing:74 tailSpacing:30];
    //    水平方向平均分布（声明三个间距）
    [@[_view1,view3] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:30 tailSpacing:30];
    //     指定item（尺寸相同）尺寸 和两头间距 拉伸item之间的间距进行布局
    //    [@[] mas_distributeViewsAlongAxis:<#(MASAxisType)#> withFixedItemLength:<#(CGFloat)#> leadSpacing:<#(CGFloat)#> tailSpacing:<#(CGFloat)#>]
    [_view1  mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo (self.view);
//        make.size.mas_equalTo(CGSizeMake(100, 200));
//        make.centerX.equalTo(self.view);
        ///  make.left.top.equalTo(self.view).offset(10);
        //   make.right.equalTo(self.view).offset(-10);
        //make.height.equalTo(view2);
        // make.width.mas_equalTo(50);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        // make.edges.equalTo(view1);
        // make.centerX.equalTo(view1);
        make.width.equalTo(self->_view1);
        make.centerX.equalTo(self->_view1);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self->_view1);
        make.centerY.equalTo(self->_view1);
    }];
#pragma mark --只要所有的约束足够算出所有的view对应的位置即可
    //    随着view的增多 有些约束可以省略 有些约束会导致冲突 所以设置约束的时候要思路清晰
//    [self test:view1];
}
- (void)viewDidAppear:(BOOL)animated{
    [self test:_view1];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}
- (void)updateViewConstraints {
    [super updateViewConstraints];
}
-(void)test:(MyView*)view{
    //return;
    NSLog(@"view.frame.orign = %f,%f ",view.frame.origin.x,view.frame.origin.y);
    NSLog(@"view frame.size = %f,%f ",view.frame.size.width,view.frame.size.height);
    NSLog(@"view bounds.orign = %f,%f",view.bounds.origin.x,view.bounds.origin.y);
    NSLog(@"view bounds.size = %f,%f ",view.bounds.size.width,view.bounds.size.height);
#pragma mark question:使用autolayout后不能获取view的sizes值吗？获取的时间点不对 此时尚未layoutSubv iew
}
/*0
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
