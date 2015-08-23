//
//  UIView+Frame.m
//  WZLCodeLibrary
//
//  Created by wzl on 15/3/23.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)tail
{
    return CGRectGetMaxX(self.frame);
}

- (void)setTail:(CGFloat)tail
{
    CGRect frame = self.frame;
    frame.origin.x = tail - frame.size.width;
    self.frame = frame;
}

- (void)setMiddleX:(CGFloat)middleX
{
    CGRect frame = self.frame;
    frame.origin.x = middleX - frame.size.width / 2;
    self.frame = frame;
}

- (CGFloat)middleX
{
    return CGRectGetMidX(self.frame);
}

- (void)setMiddleY:(CGFloat)middleY
{
    CGRect frame = self.frame;
    frame.origin.y = middleY - frame.size.height / 2 ;
    self.frame = frame;
}

- (CGFloat)middleY
{
    return CGRectGetMidY(self.frame);
}


@end