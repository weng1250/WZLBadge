//
//  TableViewDataSource.m
//  WZLBadgeDemo
//
//  Created by wengzilin on 16/3/14.
//  Copyright © 2016年 Weng-Zilin. All rights reserved.
//

#import "TableViewDataSource.h"
#import <UIKit/UIKit.h>
#import "WZLBadgeImport.h"
#import "UIView+Frame.h"

@interface TableViewDataSource ()<UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataItems;

@end

@implementation TableViewDataSource

- (instancetype)initWithDataItems:(NSMutableArray *)items
{
    if (self = [super init]) {
        self.dataItems = [NSMutableArray arrayWithArray:items];
    }
    return self;
}

#pragma mark - private

#pragma mark - datasource of UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSAssert(self.dataItems && [self.dataItems count] > 0, @"dataItems should not be empty");
    return [self.dataItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataItems objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
    }
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UIView *view = (UIView *)self.dataItems[section][row];
    [cell configCellWithItem:view indexPath:indexPath];
    return cell;
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

#pragma mark - delegate of UITableView
//to be simple, I also add delegate into datasource.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIView *view = (UIView *)self.dataItems[indexPath.section][indexPath.row];
    [view clearBadge];
}

@end

@implementation UITableViewCell (cellConfiguration)

- (void)configCellWithItem:(id)item indexPath:(NSIndexPath *)indexPath
{
    if (item && [item isKindOfClass:[UIButton class]]) {
        [self resetCell];
        UIView *view = (UIView *)item;
        view.y = 10;
        view.x = 160;
        [self.contentView addSubview:view];
        //configure cell title
        NSArray *subtitles = @[@"red dot style:", @"new style:", @"number style:", @"number style:"];
        self.detailTextLabel.text = subtitles[indexPath.row];
    }
}

- (void)resetCell
{
    UIView *view = [self getExistingBadgeParentView];
    if (view) {
        [view removeFromSuperview];
    }
}

- (UIView *)getExistingBadgeParentView
{
    for (UIView *subview in self.contentView.subviews) {
        if (subview.tag == 1000) {
            return subview;
        }
    }
    return nil;
}

@end
