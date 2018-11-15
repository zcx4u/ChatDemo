//
//  meController.m
//  myChatUIPratice
//
//  Created by 周传祥 on 2018/10/19.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "MeController.h"
#import "MyViewController.h"
#import "MeCell.h"
#import "Masonry.h"
@interface MeController ()<UITableViewDataSource,UITableViewDelegate>
@property NSArray *items;
@property UITableView *table;

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScreen *screen = [UIScreen mainScreen];
    self.navigationItem.title = @"我";
//    返回键
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"我";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    //    self.navigationItem.rightBarButtonItem = right;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"meList" ofType:@"plist"];
    _items = [[NSArray alloc]initWithContentsOfFile:path];
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen.bounds.size.width, screen.bounds.size.height)];
    _table.delegate = self;
    _table.dataSource = self;
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 200, 100, 20)];
    [view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [_table setBackgroundColor:UIColor.groupTableViewBackgroundColor];
    _table.tableFooterView =view;
//    注册特殊的cell
    [_table registerClass:[MeCell class] forCellReuseIdentifier:@"meCell"];
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
    return 20;
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
        MeCell*  cell = [[MeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"meCell"];
        cell.photo.image = [UIImage imageNamed:dict[@"photo"]];
        cell.name.text = dict[@"name"];
        cell.info.text = dict[@"info"];
        cell.QRcode.image = [UIImage imageNamed:dict[@"QRCode"]];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    if( [myCell isKindOfClass:[MeCell class]] ){
        return 80;
    }else
    {
        return _table.rowHeight = UITableViewAutomaticDimension; //其他类的cell都自动计算
    }
}
-(void)leftbutton{
    NSLog(@"left nav button ");
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
