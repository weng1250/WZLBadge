//
//  RootTabBarController.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/9/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "RootTabBarController.h"
#import "WZLBadgeImport.h"
#import "ViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self listenDeviceRotation];
    [self setupTabbar];
    [self setupTabbarBadge];
    [self setupNaviBarItems];
}

- (void)setupTabbar
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *leftVC = [sb instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
    UIViewController *rightVC = [sb instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
    self.viewControllers = @[leftVC, rightVC];
    
    UITabBarItem *leftItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    leftVC.tabBarItem = leftItem;
    UITabBarItem *rightItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
    rightVC.tabBarItem = rightItem;
}

- (void)setupTabbarBadge
{
    UITabBarItem *firstItem = self.tabBar.items.firstObject;
    //it is necessary to adjust badge position
    firstItem.badgeCenterOffset = CGPointMake(-50, 8);
    [firstItem showBadge];
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


- (void)listenDeviceRotation
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceRotation:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

#pragma mark -- handle action
- (void)handleDeviceRotation:(id)obj
{
    UITabBarItem *firstItem = self.tabBar.items.firstObject;
    if (firstItem.badge) {
        if (UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
            //adjust badge to fit portrait oriention
            firstItem.badgeCenterOffset = CGPointMake(-50, 8);
        } else if(UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])) {
            firstItem.badgeCenterOffset = CGPointMake(-120, 8);
        }
    }
}

- (void)onBarItemClicked:(UIBarButtonItem *)sender
{
    [sender clearBadge];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
