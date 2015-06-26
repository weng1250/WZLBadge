//
//  ViewController.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WZLBadge.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *settingBtn;
@property (strong, nonatomic) IBOutlet UIButton *settingBtn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.settingBtn showBadgeWithStyle:WBadgeStyleRedDot value:0 animationType:WBadgeAnimTypeBreathe];
    [self.settingBtn2 showBadgeWithStyle:WBadgeStyleNew value:0 animationType:WBadgeAnimTypeBreathe];
    
    [self.settingBtn addTarget:self action:@selector(onBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.settingBtn2 addTarget:self action:@selector(onBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onBtnPressed:(UIButton *)sender
{
    [sender clearBadge];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
