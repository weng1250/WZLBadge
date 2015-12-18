//
//  WZLBadgeProtocol.h
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/8/12.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

//WZLBadgeProtocol is a protocol which any Class supported (such UIView and UIBarButtonItem) should confirm
//At present, there are two classes support WZLBadge(UIView and UIBarButtonItem). However, there may be more classes to support. Thus, it is necessary to abstract a protocol. 20150812.


#ifndef WZLBadgeDemo_WZLBadgeProtocol_h
#define WZLBadgeDemo_WZLBadgeProtocol_h

#pragma mark -- types definition

#define kBadgeBreatheAniKey     @"breathe"
#define kBadgeRotateAniKey      @"rotate"
#define kBadgeShakeAniKey       @"shake"
#define kBadgeScaleAniKey       @"scale"
#define kBadgeBounceAniKey      @"bounce"

//key for associative methods during runtime
static char badgeLabelKey;
static char badgeBgColorKey;
static char badgeFontKey;
static char badgeTextColorKey;
static char badgeAniTypeKey;
static char badgeFrameKey;
static char badgeCenterOffsetKey;

typedef NS_ENUM(NSUInteger, WBadgeStyle)
{
    WBadgeStyleRedDot = 0,          /* red dot style */
    WBadgeStyleNumber,              /* badge with number */
    WBadgeStyleNew                  /* badge with a fixed text "new" */
};

typedef NS_ENUM(NSUInteger, WBadgeAnimType)
{
    WBadgeAnimTypeNone = 0,         /* without animation, badge stays still */
    WBadgeAnimTypeScale,            /* scale effect */
    WBadgeAnimTypeShake,            /* shaking effect */
    WBadgeAnimTypeBounce,           /* bouncing effect */
    WBadgeAnimTypeBreathe           /* breathing light effect, which makes badge more attractive */
};


#pragma mark -- protocol definition

@protocol WZLBadgeProtocol <NSObject>

@required

@property (nonatomic, strong) UILabel *badge;           /* badge entity, which is adviced not to set manually */
@property (nonatomic, strong) UIFont *badgeFont;		/* [UIFont boldSystemFontOfSize:9] by default if not set */
@property (nonatomic, strong) UIColor *badgeBgColor;    /* red color by default if not set */
@property (nonatomic, strong) UIColor *badgeTextColor;  /* white color by default if not set */
@property (nonatomic, assign) CGRect badgeFrame;        /* we have optimized the badge frame and center.
                                                         This property is adviced not to set manually */

@property (nonatomic, assign) CGPoint  badgeCenterOffset;/* offset from right-top corner. {0,0} by default */
                                                        /* For x, negative number means left offset
                                                        For y, negative number means bottom offset */

@property (nonatomic, assign) WBadgeAnimType aniType;   /* NOTE that this is not animation type of badge's
                                                         appearing, nor  hidding*/

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
 *  clear badge
 */
- (void)clearBadge;


@end

#endif
