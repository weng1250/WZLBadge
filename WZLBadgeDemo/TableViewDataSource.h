//
//  TableViewDataSource.h
//  WZLBadgeDemo
//
//  Created by wengzilin on 16/3/14.
//  Copyright © 2016年 Weng-Zilin. All rights reserved.
//
//  This class provides datasource for tableView in ViewController

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithDataItems:(NSMutableArray *)items;

@end


@interface UITableViewCell (cellConfiguration)

- (void)configCellWithItem:(id)item indexPath:(NSIndexPath *)indexPath;

@end