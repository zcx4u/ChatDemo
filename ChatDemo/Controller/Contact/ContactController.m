//
//  myTableVC.m
//  ChatDemo
//
//  Created by 周传祥 on 2018/10/22.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "ContactController.h"
#import "MyViewController.h"
@interface ContactController ()<UISearchResultsUpdating>

@property NSArray *lists;
@property NSMutableArray *filterLists;
@property UISearchController *search;
@property NSMutableDictionary *dictinory;
@property NSMutableArray *groups;
-(void)filterAllData:(NSString *)searchText;
@end

@implementation ContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"barbuttonicon_addfriends_30x30_"] style:UIBarButtonItemStyleDone target:self action:@selector(addFriends)];
   
    self.navigationItem.title = @"通讯录";
    self.navigationItem.rightBarButtonItem = right;
//    返回按钮
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"通讯录";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"addressList" ofType:@"plist"];
    _dictinory = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    NSArray *keys =[ [_dictinory allKeys] sortedArrayUsingSelector:@selector(compare:)];
    _groups = [[NSMutableArray alloc]initWithArray:keys];
    self.tableView.tableFooterView = [UIView new];
    [self filterAllData:@""];
    _search = [[UISearchController alloc]initWithSearchResultsController:nil];
    _search.searchResultsUpdater = self;
    _search.dimsBackgroundDuringPresentation = false;
    [_search.searchBar sizeToFit];
    self.tableView.tableHeaderView = _search.searchBar;
    self.definesPresentationContext = YES;
    self.tableView.sectionIndexColor = UIColor.grayColor;
    
    [right setTintColor:UIColor.whiteColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    //NSLog(@"groupCount = %ld", _groups.count);
    NSArray *keys =[ [_dictinory allKeys] sortedArrayUsingSelector:@selector(compare:)];
    _groups = [[NSMutableArray alloc]initWithArray:keys];
    return _groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    NSString *name  = self.groups[section];
    NSArray *arr = _dictinory[name];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifer"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifer"];
    }
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *groupName = _groups[section];
    NSArray *arr = _dictinory[groupName];
    NSString*img = [[NSString alloc]initWithFormat:@"photos%d",rand()%4+1];
    cell.imageView.image = [UIImage imageNamed:img];
    cell.textLabel.text = arr[row];
    //accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.hidesBottomBarWhenPushed = YES;
    MyViewController *myView = [[MyViewController alloc]init];
    [self.navigationController pushViewController:myView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (void)filterAllData:(NSString *)searchText{
    NSPredicate * predicate;
    NSArray *arr;
    if([searchText length] == 0){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"addressList" ofType:@"plist"];
        _dictinory = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
        return;
    }else{
        //遍历字典筛选数据
        predicate = [NSPredicate predicateWithFormat:@"SELF contains[c]%@",searchText];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        for(NSString * key in _dictinory)
        {
            arr= [_dictinory[key] filteredArrayUsingPredicate:predicate];
            if(arr.count>0){
                [dict setValue:arr forKey:key];
            }
            
        }
        _dictinory = [[NSMutableDictionary alloc]initWithDictionary:dict];
    }
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *str = searchController.searchBar.text;
    [self filterAllData:str];
    [self.tableView reloadData];
}
//覆写的父类方法
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _groups;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _groups[section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}


-(void)addFriends{
    NSLog(@"addFriends button clicked");
}
@end
