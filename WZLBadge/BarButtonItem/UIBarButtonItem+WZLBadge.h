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

@property (nonatomic, strong) UILabel *badge;           /* badge entity, which is adviced not to set manually */
@property (nonatomic, strong) UIColor *badgeBgColor;    /* red color by default if not set */
@property (nonatomic, strong) UIColor *badgeTextColor;  /* white color by default if not set */
@property (nonatomic, assign) CGRect badgeFrame;        /* we have optimized the badge frame and center.
                                                         This property is adviced not to set manually */

@property (nonatomic, assign) CGPoint  badgeCenterOffset;/* offset from right-top corner. {0,0} by default */
                                                         /* For x, negative number means left offset 
                                                            For y, negative number means bottom offset
                                                          */

@property (nonatomic, assign) WBadgeAnimType aniType;   /* NOTE that this is not animation type of badge's
                                                         appearing, nor  hidding*/

/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)showBadge;

/**
 *  showBadge
 *
 *  @param value String value, default is `nil`.
 *  @param aniType
 */
- (void)showBadgeValue:(NSString *)value
         animationType:(WBadgeAnimType)aniType;


/**
 *  clear badge
 */
- (void)clearBadge;


@end
