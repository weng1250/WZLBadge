//
//  UIBarButtonItem+WZLBadge.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/8/10.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "UIBarButtonItem+WZLBadge.h"
#import <objc/runtime.h>

#define kActualView     [self getActualBadgeSuperView]


@implementation UIBarButtonItem (WZLBadge)

#pragma mark -- public methods

/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)showBadge
{
    if (@available(iOS 11.0, *)) {
        [self swizzling_willMoveToSuperview];
    }
    
    [kActualView showBadge];
}

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
             animationType:(WBadgeAnimType)aniType
{
    if (@available(iOS 11.0, *)) {
        [self swizzling_willMoveToSuperview];
    }
    
    [kActualView showBadgeWithStyle:style value:value animationType:aniType];
}


/**
 *  clear badge
 */
- (void)clearBadge
{
    [kActualView clearBadge];
}

- (void)resumeBadge
{
    [kActualView resumeBadge];
}

#pragma mark -- private method

/**
 Swizzling -[_UIButtonBarButton willMoveToSuperview:]
 */
- (void)swizzling_willMoveToSuperview __IOS_AVAILABLE(11.0) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(willMoveToSuperview:);
        SEL swizzledSelector = NSSelectorFromString(@"wzl_willMoveToSuperview:");
        Method originalMethod = class_getInstanceMethod(NSClassFromString(@"_UIButtonBarButton"), originalSelector);
        Method swizzledMethod = class_getInstanceMethod(super.class, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

/**
 *  Because UIBarButtonItem is kind of NSObject, it is not able to directly attach badge.
    This method is used to find actual view (non-nil) inside UIBarButtonItem instance.
 *
 *  @return view
 */
- (UIView *)getActualBadgeSuperView
{
    return [self valueForKeyPath:@"_view"];//use KVC to hack actual view
}

#pragma mark -- setter/getter
- (UILabel *)badge
{
    return kActualView.badge;
}

- (void)setBadge:(UILabel *)label
{
    [kActualView setBadge:label];
}

- (UIFont *)badgeFont
{
	return kActualView.badgeFont;
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
	[kActualView setBadgeFont:badgeFont];
}

- (UIColor *)badgeBgColor
{
    return [kActualView badgeBgColor];
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor
{
    [kActualView setBadgeBgColor:badgeBgColor];
}

- (UIColor *)badgeTextColor
{
    return [kActualView badgeTextColor];
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    [kActualView setBadgeTextColor:badgeTextColor];
}

- (WBadgeAnimType)aniType
{
    return [kActualView aniType];
}

- (void)setAniType:(WBadgeAnimType)aniType
{
    [kActualView setAniType:aniType];
}

- (CGRect)badgeFrame
{
    return [kActualView badgeFrame];
}

- (void)setBadgeFrame:(CGRect)badgeFrame
{
    [kActualView setBadgeFrame:badgeFrame];
}

- (CGPoint)badgeCenterOffset
{
    return [kActualView badgeCenterOffset];
}

- (void)setBadgeCenterOffset:(CGPoint)badgeCenterOffset
{
    [kActualView setBadgeCenterOffset:badgeCenterOffset];
}

- (NSInteger)badgeMaximumBadgeNumber
{
    return [kActualView badgeMaximumBadgeNumber];
}

- (void)setBadgeMaximumBadgeNumber:(NSInteger)badgeMaximumBadgeNumber
{
    [kActualView setBadgeMaximumBadgeNumber:badgeMaximumBadgeNumber];
}

@end
