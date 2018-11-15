//
//  wxController.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/10/19.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "MainFrameController.h"
#import "MyViewController.h"
#import "ChatCell.h"
#import "DXPopover.h"
#import "MasonryVC.h"
#import "PopFrame.h"
#import "Masonry.h"
@interface MainFrameController ()<UITableViewDelegate,UITableViewDataSource,clickDelegate>
@property NSArray *items;
@property UITableView *table;
@property UISearchController *search;
@property NSMutableArray *fiterDatas;
@property  (strong,nonatomic)UIView *popView;
@property DXPopover *popover;
@property (strong,nonatomic)UIBarButtonItem *right;
@property NSArray *img;
@property NSArray *name;
@property PopFrame *pop;
@end

@implementation MainFrameController
- (void)viewDidLoad {
    [super viewDidLoad];
    //    注册cell
    [_table registerClass:[ChatCell class] forCellReuseIdentifier:@"chatCell"];
    UIScreen *screen = [UIScreen mainScreen];
    _right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"barbuttonicon_add_30x30_"] style:UIBarButtonItemStyleDone target:self action:@selector(addPopButton:event:)];
    [_right setTintColor:UIColor.whiteColor];
    self.navigationItem.title = @"微信";
    self.navigationItem.rightBarButtonItem = _right;
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"微信";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen.bounds.size.width, screen.bounds.size.height)];
    _table.delegate = self;
    _table.dataSource = self;
    _table.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_table];
    _img = @[@"contacts_add_newmessage_30x30_",@"barbuttonicon_add_cube_30x30_",@"contacts_add_scan_30x30_",@"barbuttonicon_add_30x30_"];
    _name = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    _pop = [[PopFrame alloc]initWithFrame:CGRectMake(0, 0, 140, 180)];
    _pop.img = _img;
    _pop.name = _name;
    _pop.delegate = self;
    _popover = [DXPopover popover];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    if( [myCell isKindOfClass:[ChatCell class]] ){
        return 80;
    }else
    {
        return _table.rowHeight = UITableViewAutomaticDimension; //其他类的cell都自动计算
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"chatCell"];
    
    if(!cell)
    {
        cell = [[ChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"chatCell"];
    }
    NSArray *names =@[@"DearBruin",@"饿了么",@"XX团购分享群",@"北京地铁",@"爱奇艺"];
    NSArray *infos =@[@"alloc]initWithStyle",@"开发实现Label中多颜色多字体",@" 东西捡不起来在线等急 ",@" 明明是没有进去的路 恭喜 ",@" sdasdasda",@"aaa sdsds sadfdfdsfsdfsdsad",@"dsagfhfghgfhfghfgjdas sdajfj hgfhfg gfhgf hgfhfg sd ",@"UITableViewCellAccessoryNone"];
    cell.photo.image = [UIImage imageNamed:[NSString stringWithFormat:@"photos%d",rand()%10+1]];
    cell.name.text = names[rand()%5];
    cell.info.text = infos[rand()%8];
    cell.time.text = @"星期五";
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.hidesBottomBarWhenPushed = YES;
    //    myViewController *myView = [[myViewController alloc]init];
    MasonryVC *myView = [[MasonryVC alloc]init];
    
    [self.navigationController pushViewController:myView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)addPopButton:(UIBarButtonItem *)sender event:(UIEvent*)event{
    NSLog(@"pop clicked ");
    
    _popover.cornerRadius = 0;
    _popover.animationIn = 0.2;
    _popover.backgroundColor = [UIColor colorWithRed:61/255.0f green:60/255.0f blue:65/255.0f alpha:0.8];
    CGPoint starPoint = CGPointMake(343, 64);
    [_popover showAtPoint:starPoint
          popoverPostion:DXPopoverPositionDown
         withContentView:_pop
                  inView:self.tabBarController.view];
    //    __weak typeof(self) weakSelf = self;
    _popover.didDismissHandler = ^{
        NSLog(@"miss");
    };
}


- (void)viewDidLayoutSubviews{
    
    NSLog(@"screen rota");
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        
        //  make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height));
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
- (void)clickedWithButton:(nonnull UIButton *)sender { 
    [self.popover dismiss];
    NSLog(@"%ld",sender.tag);
    self.hidesBottomBarWhenPushed = YES;
    //    myViewController *myView = [[myViewController alloc]init];
    MasonryVC *myView = [[MasonryVC alloc]init];
    
    [self.navigationController pushViewController:myView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)buttonClick:(UIButton *)sender{
    
}

@end
