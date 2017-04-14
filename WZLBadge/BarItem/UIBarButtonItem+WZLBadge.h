//
//  UIBarButtonItem+WZLBadge.h
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/8/10.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+WZLBadge.h"
#import "WZLBadgeProtocol.h"

@interface UIBarButtonItem (WZLBadge)<WZLBadgeProtocol>

/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)showBadge;

/**
 *  showBadge
 *
 *  @param style WBadgeStyle type
 *  @param value (if 'style' is WBadgeStyleRedDot or WBadgeStyleNew,
 this value will be ignored. In this case, any value will be ok.)
 *   @param aniType
 */
- (void)showBadgeWithStyle:(WBadgeStyle)style
                     value:(NSInteger)value
             animationType:(WBadgeAnimType)aniType;


/**
 *  clear badge(hide badge)
 */
- (void)clearBadge;

/**
 *  make bage(if existing) not hiden
 */
- (void)resumeBadge;


@end
