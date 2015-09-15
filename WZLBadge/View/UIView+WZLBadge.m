//
//  UIView+WZLBadge.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "UIView+WZLBadge.h"
#import <objc/runtime.h>
#import "CAAnimation+WAnimation.h"

@implementation UIView (WZLBadge)

#pragma mark -- public methods
/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)showBadge
{
    [self showBadgeValue:nil animationType:WBadgeAnimTypeNone];
}

/**
 *  showBadge
 *
 *  @param style WBadgeStyle type
 *  @param value (if 'style' is WBadgeStyleRedDot or WBadgeStyleNew, 
 *                this value will be ignored. In this case, any value will be ok.)
 */
- (void)showBadgeValue:(NSString *)value animationType:(WBadgeAnimType)aniType
{
    [self showBadgeWithValue:value];
    
    self.aniType = aniType;
    if(self.aniType != WBadgeAnimTypeNone) {
        [self beginAnimation];
    }
}

/**
 *  clear badge
 */
- (void)clearBadge
{
    self.badge.hidden = YES;
}

#pragma mark -- private methods
- (void)showBadgeWithValue:(NSString *)value
{
    [self badgeInit];
    
    self.badge.text = value;
    
    if (value && ![value isEqualToString:@""]) {
        [self adjustLabelWidth:self.badge];
        CGRect frame = self.badge.frame;
        frame.size.height = 12;
        if(CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
            frame.size.width = CGRectGetHeight(frame);
        }
        
        self.badge.frame = frame;
        self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
        self.badge.font = [UIFont boldSystemFontOfSize:9];
    }
    
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
    self.badge.hidden = NO;
    if (value == 0) {
        self.badge.hidden = YES;
    }
}

//lazy loading
- (void)badgeInit
{
    if (self.badgeBgColor == nil) {
        self.badgeBgColor = [UIColor redColor];
    }
    if (self.badgeTextColor == nil) {
        self.badgeTextColor = [UIColor whiteColor];
    }
    
    if (!self.badge) {
        CGFloat redotWidth = 8;
        CGRect frm = CGRectMake(CGRectGetWidth(self.frame), -redotWidth, redotWidth, redotWidth);
        self.badge = [[UILabel alloc] initWithFrame:frm];
        self.badge.textAlignment = NSTextAlignmentCenter;
        self.badge.backgroundColor = self.badgeBgColor;
        self.badge.textColor = self.badgeTextColor;
        self.badge.layer.masksToBounds = YES;//very important
        [self addSubview:self.badge];
    }
}

#pragma mark --  other private methods
- (void)adjustLabelWidth:(UILabel *)label
{
    [label setNumberOfLines:0];
    NSString *s = label.text;
    UIFont *font = [label font];
    CGSize size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) ,CGFLOAT_MAX);
    CGSize labelsize = [s sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    CGRect frame = label.frame;
    frame.size = labelsize;
    [label setFrame:frame];
}

#pragma mark -- animation

//if u want to add badge animation type, follow steps bellow:
//1. go to definition of WBadgeAnimType and add new type
//2. go to category of CAAnimation+WAnimation to add new animation interface
//3. call that new interface here
- (void)beginAnimation
{
    switch(self.aniType) {
        case WBadgeAnimTypeBreathe:
            [self.badge.layer addAnimation:[CAAnimation opacityForever_Animation:1.4]
                                    forKey:kBadgeBreatheAniKey];
            break;
        case WBadgeAnimTypeShake:
            [self.badge.layer addAnimation:[CAAnimation shake_AnimationRepeatTimes:CGFLOAT_MAX
                                                                          durTimes:1
                                                                            forObj:self.badge.layer]
                                    forKey:kBadgeShakeAniKey];
            break;
        case WBadgeAnimTypeScale:
            [self.badge.layer addAnimation:[CAAnimation scaleFrom:1.4
                                                          toScale:0.6
                                                         durTimes:1
                                                              rep:MAXFLOAT]
                                    forKey:kBadgeScaleAniKey];
            break;
        case WBadgeAnimTypeBounce:
            [self.badge.layer addAnimation:[CAAnimation bounce_AnimationRepeatTimes:CGFLOAT_MAX
                                                                          durTimes:1
                                                                            forObj:self.badge.layer]
                                    forKey:kBadgeBounceAniKey];
            break;
        case WBadgeAnimTypeNone:
        default:
            break;
    }
}


#pragma mark -- setter/getter
- (UILabel *)badge
{
    return objc_getAssociatedObject(self, &badgeLabelKey);
}

- (void)setBadge:(UILabel *)label
{
    objc_setAssociatedObject(self, &badgeLabelKey, label, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)badgeBgColor
{
    return objc_getAssociatedObject(self, &badgeBgColorKey);
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor
{
    objc_setAssociatedObject(self, &badgeBgColorKey, badgeBgColor, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)badgeTextColor
{
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN);
}

- (WBadgeAnimType)aniType
{
    id obj = objc_getAssociatedObject(self, &badgeAniTypeKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj integerValue];
    }
    else
        return WBadgeAnimTypeNone;
}

- (void)setAniType:(WBadgeAnimType)aniType
{
    NSNumber *numObj = @(aniType);
    objc_setAssociatedObject(self, &badgeAniTypeKey, numObj, OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)badgeFrame
{
    id obj = objc_getAssociatedObject(self, &badgeFrameKey);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 4) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        CGFloat width = [obj[@"width"] floatValue];
        CGFloat height = [obj[@"height"] floatValue];
        return  CGRectMake(x, y, width, height);
    } else
        return CGRectZero;
}

- (void)setBadgeFrame:(CGRect)badgeFrame
{
    NSDictionary *frameInfo = @{@"x" : @(badgeFrame.origin.x), @"y" : @(badgeFrame.origin.y),
                                @"width" : @(badgeFrame.size.width), @"height" : @(badgeFrame.size.height)};
    objc_setAssociatedObject(self, &badgeFrameKey, frameInfo, OBJC_ASSOCIATION_RETAIN);
}

- (CGPoint)badgeCenterOffset
{
    id obj = objc_getAssociatedObject(self, &badgeCenterOffsetKey);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 2) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        return CGPointMake(x, y);
    } else
        return CGPointZero;
}

- (void)setBadgeCenterOffset:(CGPoint)badgeCenterOff
{
    NSDictionary *cenerInfo = @{@"x" : @(badgeCenterOff.x), @"y" : @(badgeCenterOff.y)};
    objc_setAssociatedObject(self, &badgeCenterOffsetKey, cenerInfo, OBJC_ASSOCIATION_RETAIN);
}

@end
