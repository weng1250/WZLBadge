//
//  CollectionViewEmbedTableViewController.m
//  WZLBadgeDemo
//
//  Created by felix on 2017/6/19.
//  Copyright © 2017年 Weng-Zilin. All rights reserved.
//

#import "TableViewCollectionViewController.h"
#import "WZLBadgeImport.h"

@interface TableViewCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSInteger const cellNum = 120;
static NSInteger const numberOfAStyle = 3;

@implementation TableViewCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"test cell reuse";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor = [UIColor grayColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -- tableView delegate and datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = @"hello words";
    cell.textLabel.backgroundColor = [UIColor whiteColor];
    cell.detailTextLabel.text = @"description text";
    cell.detailTextLabel.backgroundColor = [UIColor greenColor];
    
    switch (indexPath.row%numberOfAStyle) {
        case WBadgeStyleRedDot:
        {
            cell.contentView.badgeRadius = 4.f;
            cell.contentView.badgeCenterOffset = CGPointMake(-100, 30);
            [cell.contentView showBadge];
        }
            break;
        case WBadgeStyleNumber:
        {
            [cell.contentView showNumberBadgeWithValue:indexPath.row];
            cell.contentView.badgeCenterOffset = CGPointMake(-100, 30);
        }
            break;
        case WBadgeStyleNew:
        {
            [cell.contentView showBadgeWithStyle:WBadgeStyleNew value:0 animationType:WBadgeAnimTypeNone];
            cell.contentView.badgeCenterOffset = CGPointMake(-100, 30);
        }
            break;
        default:
            break;
    }
    return cell;
}

-  (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

@end
