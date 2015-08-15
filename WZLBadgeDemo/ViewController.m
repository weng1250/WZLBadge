//
//  ViewController.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "WZLBadgeImport.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataItems;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WZLBadge Examples";
    [self setup];
    [self initItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- private methods
- (void)setup
{
    //configure table view
    CGFloat y = NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0 ? 64 : 44;
    CGRect frame = CGRectMake(0, y, self.view.width, self.view.height);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.userInteractionEnabled = YES;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    
    [self setupNaviBarItems];
}

- (void)setupNaviBarItems
{
    //configure navi item
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_list.png"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(onBarItemClicked:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //show example of customize badge`s centerOffset property
    leftItem.badgeCenterOffset = CGPointMake(-8, 0);
    [leftItem showBadge];
}

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
    NSArray *subtitles = @[@"red dot style:", @"new style:", @"number style:", @"number style:"];
    cell.detailTextLabel.text = subtitles[row];
}

#pragma mark -- handle actions
- (void)onBarItemClicked:(UIBarButtonItem *)sender
{
    [sender clearBadge];
}


#pragma mark -- delegate of tableview

- (void)initItems
{
    self.dataItems = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSMutableArray *staticBadges = [NSMutableArray array];
    NSMutableArray *dynamicBadges = [NSMutableArray array];
    
    WBadgeStyle styles[] = {WBadgeStyleRedDot, WBadgeStyleNew, WBadgeStyleNumber, WBadgeStyleNumber};
    for (NSInteger i = 0; i < sizeof(styles) / sizeof(styles[0]); i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.width / 2;
        if (i == 1) {
            btn.badgeBgColor = [UIColor purpleColor];
            btn.badgeCenterOffset = CGPointMake(-btn.width, 0);
        }
        if (i == 2) {
            btn.badgeBgColor = [UIColor blueColor];
        }
        [btn showBadgeWithStyle:styles[i] value:99 animationType:WBadgeAnimTypeNone];//actual badge call comes here.
        [staticBadges addObject:btn];
    }
    
    WBadgeAnimType animations[] = {WBadgeAnimTypeScale, WBadgeAnimTypeBreathe, WBadgeAnimTypeShake, WBadgeAnimTypeBounce};
    for (NSInteger i = 0; i < sizeof(animations) / sizeof(animations[0]); i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.width / 2;
        [btn showBadgeWithStyle:styles[i] value:99 animationType:animations[i]];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIView *view = (UIView *)self.dataItems[indexPath.section][indexPath.row];
    [view clearBadge];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *headTitles = @[@"badge with not any animation", @"badge with animations"];
    return headTitles[section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == [self.dataItems count] - 1) {
        return @"Select cell to clear badge.";
    }
    return nil;
}

@end
