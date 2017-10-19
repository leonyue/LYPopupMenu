//
//  LYPlasticPopupMenu.h
//  LYPopupMenu
//
//  Created by dj.yue on 2017/10/18.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "LYPopupMenu.h"

@interface LYPlasticPopupMenu : LYPopupMenu

// NOTE: When subclassing this class, use these methods to customize the appearance.
- (CGMutablePathRef)upperHeadPathInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius CF_RETURNS_RETAINED;
- (CGMutablePathRef)lowerHeadPathInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius CF_RETURNS_RETAINED;
- (CGMutablePathRef)upperTailPathInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius CF_RETURNS_RETAINED;
- (CGMutablePathRef)lowerTailPathInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius CF_RETURNS_RETAINED;

- (void)drawLeftSeparatorInRect:(CGRect)rect highlighted:(BOOL)highlighted;
- (void)drawRightSeparatorInRect:(CGRect)rect highlighted:(BOOL)highlighted;

@end
