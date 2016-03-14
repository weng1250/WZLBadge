//
//  ViewController.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"
#import "UIView+Frame.h"
#import "WZLBadgeImport.h"

@interface ViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewDataSource *tabDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WZLBadge Examples";
    [self setup];
    [self loadTableViewDataSource];
}


#pragma mark -- private methods
- (void)setup
{
    //configure table view
    CGFloat y = NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0 ? 64 : 44;
    CGRect frame = CGRectMake(0, y, self.view.width, self.view.height - y - 44);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.userInteractionEnabled = YES;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.rowHeight = 60;
    [self.view addSubview:self.tableView];
}

- (void)loadTableViewDataSource
{
    self.tabDataSource = [[TableViewDataSource alloc] initWithDataItems:[self prepareDataItems]];
    self.tableView.dataSource = self.tabDataSource;
}

- (NSMutableArray *)prepareDataItems
{
    NSMutableArray *dataItems = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSMutableArray *staticBadges = [NSMutableArray array];
    NSMutableArray *dynamicBadges = [NSMutableArray array];
    
    WBadgeStyle styles[] = {WBadgeStyleRedDot, WBadgeStyleNew, WBadgeStyleNumber, WBadgeStyleNumber};
    for (NSInteger i = 0; i < sizeof(styles) / sizeof(styles[0]); i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        btn.tag = 1000;
        [btn setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.width / 2;
        if (i == 1) {
            btn.badgeBgColor = [UIColor purpleColor];
            btn.badgeCenterOffset = CGPointMake(-btn.width, 0);
        } else
            if (i == 2) {
                btn.badgeBgColor = [UIColor blueColor];
            }
        [btn showBadgeWithStyle:styles[i] value:100 animationType:WBadgeAnimTypeNone];//actual badge call comes here.
        [staticBadges addObject:btn];
    }
    
    WBadgeAnimType animations[] = {WBadgeAnimTypeShake, WBadgeAnimTypeBounce, WBadgeAnimTypeBreathe, WBadgeAnimTypeScale};
    for (NSInteger i = 0; i < sizeof(animations) / sizeof(animations[0]); i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        btn.tag = 1000;
        [btn setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.width / 2;
        [btn showBadgeWithStyle:styles[i] value:100 animationType:animations[i]];
        [dynamicBadges addObject:btn];
    }
    [dataItems addObject:staticBadges];
    [dataItems addObject:dynamicBadges];
    return dataItems;
}

@end
