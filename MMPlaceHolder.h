//
//  MMPlaceHolder.h
//  driving
//
//  Created by Ralph Li on 8/11/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMPlaceHolder : UIView

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, assign) CGFloat arrowSize;

@end


@interface  UIView(MMPlaceHolder)

- (void)showPlaceHolder;
- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor;
- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor;
- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor arrowSize:(CGFloat)arrowSize;

- (void)hidePlaceHolder;
- (MMPlaceHolder *)getPlaceHolder;

@end
