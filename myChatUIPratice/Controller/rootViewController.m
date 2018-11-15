//
//  rootViewController.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/10/19.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "rootViewController.h"
#import "wxController.h"
#import "txlController.h"
#import "findController.h"
#import "meController.h"

@interface rootViewController ()
//@property UILabel *label;
//@property NSArray *titles;
//@property NSArray *images;
//@property NSArray *selectedImages;
//@property NSArray *classNames;


@property NSArray *class;
@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}
-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    wxController *vc1 = [[wxController alloc]init];
    txlController *vc2 = [[txlController alloc]init];
    findController *vc3 = [[findController alloc]init];
    meController *vc4 = [[meController alloc]init];
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    vc1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"微信" image:[UIImage imageNamed:@"img1"] selectedImage:[UIImage imageNamed:@"home_highlight"]];
    vc2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"通讯录" image:[UIImage imageNamed:@"img2"] selectedImage:[UIImage imageNamed:@"service_highlight"]];
    vc3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"img3"] selectedImage:[UIImage imageNamed:@"service_highlight"]];
    vc4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"img4"] selectedImage:[UIImage imageNamed:@"service_highlight"]];
  
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
