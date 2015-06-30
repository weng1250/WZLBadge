//
//  ViewController.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WZLBadge.h"
#import "UIView+Frame.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataItems;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.userInteractionEnabled = YES;
    [self.view addSubview:self.tableView];
    
    self.dataItems = [[NSMutableArray alloc] initWithCapacity:0];
    [self initItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- private methods
- (void)configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UIView *view = (UIView *)self.dataItems[section][row];
    view.y = 10;
    view.middleX = cell.width / 2;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        [cell.contentView addSubview:view];
    } else {
        [cell addSubview:view];
    }
    //configure cell title
    NSArray *subtitles = @[@"red dot style:", @"new style:", @"number style:"];
    cell.detailTextLabel.text = subtitles[row];
}

#pragma mark -- delegate of tableview
- (void)initItems
{
    NSMutableArray *staticBadges = [NSMutableArray array];
    NSMutableArray *dynamicBadges = [NSMutableArray array];
    
    WBadgeStyle styles[] = {WBadgeStyleRedDot, WBadgeStyleNew, WBadgeStyleNumber};
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.width / 2;
        [btn showBadgeWithStyle:styles[i] value:1 animationType:WBadgeAnimTypeNone];
        [staticBadges addObject:btn];
    }
    
    WBadgeAnimType animations[] = {WBadgeAnimTypeRotate, WBadgeAnimTypeBreathe, WBadgeAnimTypeRotate};
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.width / 2;
        [btn showBadgeWithStyle:styles[i] value:1 animationType:animations[i]];
        [dynamicBadges addObject:btn];
    }
    [self.dataItems addObject:staticBadges];
    [self.dataItems addObject:dynamicBadges];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataItems objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
    }
    [self configCell:cell indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIView *view = (UIView *)self.dataItems[indexPath.section][indexPath.row];
    [view clearBadge];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *headTitles = @[@"badge with not any animation", @"badge with animations"];
    return headTitles[section];
}

@end
