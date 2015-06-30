//
//  NSObject+WAnimation.h
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/26.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WAxis)
{
    WAxisX = 0,
    WAxisY,
    WAxisZ
};

@interface CAAnimation (WAnimation)

//breathing forever
+(CABasicAnimation *)opacityForever_Animation:(float)time;

//breathing with fixed repeated times
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;

//rotate
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(WAxis)axis repeatCount:(int)repeatCount;

//scale
+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;

@end
