//
//  findController.m
//  ChatDemo
//
//  Created by 周传祥 on 2018/10/19.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "FindController.h"
#import "MyViewController.h"
#import "FriendsCircleCell.h"
#import "Masonry.h"
@interface FindController ()<UITableViewDelegate,UITableViewDataSource>
@property NSArray *items;
@property NSDictionary *dict;
@property UITableView *table;
@end

@implementation FindController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //带分节的表视图。每个cell导航到新页
//    特殊的cell注册为y特别的标识符
    [_table registerClass:[FriendsCircleCell class] forCellReuseIdentifier:@"friendsCircle"];
    UIScreen *screen = [UIScreen mainScreen];
    self.navigationItem.title = @"发现";
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"发现";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"find" ofType:@"plist"];
    _items = [[NSArray alloc]initWithContentsOfFile:path];
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen.bounds.size.width,screen.bounds.size.height)];
    _table.delegate = self;
    _table.dataSource = self;
    _table.tableFooterView = [[UIView alloc]init];
    [_table setBackgroundColor:UIColor.groupTableViewBackgroundColor];
    [self.view addSubview:_table];
  
}
//返回节数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"section = %ld",_items.count);
    return _items.count;
}
//发回每一节的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _items[section];
//    NSLog(@"rows = %ld",arr.count);
    return arr.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    UIColor *color = [UIColor groupTableViewBackgroundColor];
    [view setBackgroundColor:color];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
//h构造单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //section = 第几节 ，row = 第section节的第几行
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSArray *arr = _items[section];
    NSDictionary *dict = arr[row];
    if(section == 0&&row == 0)
    {
        FriendsCircleCell*  cell = [[FriendsCircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"friendsCircle"];
        cell.textLabel.text = dict[@"name"];
        cell.imageView.image = [UIImage imageNamed:dict[@"img"]];
        cell.rightImage.image = [UIImage imageNamed:@"photo"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifer"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifer"];
        }
        cell.imageView.image = [UIImage imageNamed:dict[@"img"]];
        cell.textLabel.text = dict[@"name"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if(section == _items.count-1&&row == arr.count-1){
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.hidesBottomBarWhenPushed = YES;
    MyViewController *myView = [[MyViewController alloc]init];
    [self.navigationController pushViewController:myView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)leftbutton{
    NSLog(@"left nav button ");
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    _table.tintColor = [UIColor groupTableViewBackgroundColor];
}

- (void)viewDidLayoutSubviews{
    
    NSLog(@"screen rota");
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        
      //  make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height));
         make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
@end
